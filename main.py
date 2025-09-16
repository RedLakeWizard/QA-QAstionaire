from __future__ import annotations
import os
import sys
from typing import Any, Dict, List, Tuple
import mysql.connector

# optional dotenv
try:
    from dotenv import load_dotenv  # type: ignore
    load_dotenv()
except Exception:
    pass

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = int(os.getenv("DB_PORT", "3306"))
DB_USER = os.getenv("DB_USER", "root")
DB_PASS = os.getenv("DB_PASS", "")
DB_NAME = os.getenv("DB_NAME", "istqb_exam")


def connect() -> Any:
    """
    Return type left as Any (avoids Pylance complaining about union mysql types).
    """
    return mysql.connector.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        password=DB_PASS,
        database=DB_NAME
    )


def to_int_safe(x: Any) -> int:
    """Convert many DB numeric-like types to int safely."""
    if x is None:
        return 0
    # If it's already an int, return directly
    if isinstance(x, int):
        return x
    # Try int conversion directly; otherwise use str then int
    try:
        return int(x)
    except Exception:
        try:
            return int(str(x))
        except Exception:
            return 0


def get_total(conn: Any) -> int:
    cur = conn.cursor()
    cur.execute("SELECT COUNT(*) FROM questions")
    row = cur.fetchone()
    cur.close()
    # row can be tuple-like; handle defensively
    if not row:
        return 0
    # first column
    return to_int_safe(row[0])


def ensure_dict_rows_from_cursor(cur: Any, rows: List[Any]) -> List[Dict[str, Any]]:
    """
    Convert rows returned by cursor.fetchall() into List[Dict[str,Any]] using cur.column_names
    or dictionary cursor content. This normalizes types (bytes -> str keys/values).
    """
    dict_rows: List[Dict[str, Any]] = []

    # If rows are already dicts (dictionary=True), coerce keys/values
    if rows and isinstance(rows[0], dict):
        for r in rows:
            # r may have bytes keys or values; normalize keys -> str and values -> decoded str where appropriate
            new_r: Dict[str, Any] = {}
            for k, v in r.items():
                key = k.decode('utf-8') if isinstance(k, (bytes, bytearray)) else str(k)
                # decode bytes values to str, otherwise keep as is
                if isinstance(v, (bytes, bytearray)):
                    try:
                        new_v = v.decode('utf-8')
                    except Exception:
                        new_v = str(v)
                else:
                    new_v = v
                new_r[key] = new_v
            dict_rows.append(new_r)
        return dict_rows

    # Otherwise rows are sequences (tuples). Use column names from cursor to map them.
    cols: Tuple[str, ...] = getattr(cur, "column_names", tuple())
    if not cols:
        # fallback: return empty dicts
        for _ in rows:
            dict_rows.append({})
        return dict_rows

    for r in rows:
        new_r = {}
        # r might be tuple; align with column names
        for idx, col in enumerate(cols):
            try:
                val = r[idx]
            except Exception:
                val = None
            key = col.decode('utf-8') if isinstance(col, (bytes, bytearray)) else str(col)
            if isinstance(val, (bytes, bytearray)):
                try:
                    val2 = val.decode('utf-8')
                except Exception:
                    val2 = str(val)
            else:
                val2 = val
            new_r[key] = val2
        dict_rows.append(new_r)

    return dict_rows


def fetch_random(conn: Any, n: int) -> List[Dict[str, Any]]:
    # use normal cursor and fetch tuples, or dictionary cursor depending on driver behavior
    cur = conn.cursor()  # we'll map with column names
    cur.execute("SELECT * FROM questions ORDER BY RAND() LIMIT %s", (n,))
    rows = cur.fetchall()
    dict_rows = ensure_dict_rows_from_cursor(cur, rows)
    cur.close()
    return dict_rows


def safe_upper(value: Any) -> str:
    if value is None:
        return ""
    try:
        return str(value).upper()
    except Exception:
        return ""


def run_quiz(n: int) -> None:
    conn = connect()
    total = get_total(conn)
    if total == 0:
        print("Database has no questions. Import SQL first.")
        conn.close()
        return

    if n > total:
        print(f"Requested {n} questions but DB has only {total}. Using {total} instead.")
        n = total

    qs = fetch_random(conn, n)
    score = 0

    for i, q in enumerate(qs, start=1):
        # q is Dict[str, Any]; use .get and convert to str
        qtext = str(q.get('question_text', '')).strip()
        a = str(q.get('option_a', '')).strip()
        b = str(q.get('option_b', '')).strip()
        c = str(q.get('option_c', '')).strip()
        d = str(q.get('option_d', '')).strip()
        correct_raw = q.get('correct_option')

        print("\n" + "-" * 60)
        print(f"Q{i}: {qtext}\n")
        print(f"A) {a}")
        print(f"B) {b}")
        print(f"C) {c}")
        print(f"D) {d}")

        while True:
            ans = input("Your answer (A/B/C/D): ").strip().upper()
            if ans in ("A", "B", "C", "D"):
                break
            print("Please enter A, B, C or D.")

        correct = safe_upper(correct_raw)
        if correct not in ("A", "B", "C", "D"):
            print(f"Note: correct answer for Q{i} is not set in DB (value='{correct_raw}').")
        else:
            if ans == correct:
                print("Correct!")
                score += 1
            else:
                print(f"Wrong. Correct answer: {correct}")

    print("\n" + "=" * 60)
    percent = (score / float(n) * 100.0) if n > 0 else 0.0
    print(f"Score: {score}/{n} ({percent:.1f}%)")
    conn.close()


if __name__ == "__main__":
    num = 40
    if len(sys.argv) > 1:
        try:
            num = int(sys.argv[1])
        except Exception:
            print("Argument must be integer. Using default 40.")
    run_quiz(num)
