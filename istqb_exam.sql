-- istqb_practice_questions.sql
-- LLM generated questions until I figure out how to automate the mass-fetching of the official Syllabus PDF questions

DROP DATABASE IF EXISTS istqb_exam;
CREATE DATABASE istqb_exam CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE istqb_exam;

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question_text TEXT NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL, -- 'A', 'B', 'C', 'D'
    category VARCHAR(100)
);

INSERT INTO questions (question_text, option_a, option_b, option_c, option_d, correct_option, category) VALUES
('What is the primary objective of software testing?', 'To find defects', 'To prove that the software has no defects', 'To repair bugs', 'To approve code for release', 'A', 'Fundamentals'),
('Which activity is focused on identifying the cause of a defect once a failure has occurred?', 'Testing', 'Debugging', 'Validation', 'Verification', 'B', 'Fundamentals'),
('Which of the following best describes regression testing?', 'Testing new features only', 'Testing to ensure changes did not break existing functionality', 'Performance testing under load', 'Security testing for vulnerabilities', 'B', 'Test Management'),
('Which test level focuses on interactions between integrated components?', 'Unit testing', 'Integration testing', 'System testing', 'Acceptance testing', 'B', 'Test Levels'),
('Which test technique is a white-box technique?', 'Equivalence partitioning', 'Boundary value analysis', 'Statement coverage', 'Decision table testing', 'C', 'Test Techniques'),
('Which of the following is a black-box test design technique?', 'Path coverage', 'Boundary value analysis', 'Statement coverage', 'Condition coverage', 'B', 'Test Techniques'),
('What does test coverage measure?', 'Number of defects found', 'Amount of source code executed by tests or requirements exercised', 'Time spent testing', 'Number of test cases written', 'B', 'Fundamentals'),
('Who is primarily responsible for defining the test policy in an organization?', 'Project manager', 'Test manager or organization test authority', 'Developers', 'End users', 'B', 'Test Management'),
('Which document typically contains the test objectives, scope, approach, and resources?', 'Test plan', 'Test case', 'Bug report', 'Release notes', 'A', 'Test Management'),
('What is the main purpose of a test incident report?', 'To document test cases', 'To record an observed issue or failure during testing', 'To schedule test runs', 'To list test environments', 'B', 'Test Management'),
('Which of these is a non-functional test?', 'Equivalence partitioning', 'Load testing', 'Boundary value analysis', 'Decision table testing', 'B', 'Test Types'),
('What is risk-based testing?', 'Testing only the new features', 'Prioritizing tests based on the probability and impact of failure', 'Running all tests in alphabetical order', 'Testing only when a defect is found', 'B', 'Test Management'),
('Which one is NOT a typical exit criterion for a test phase?', 'All planned tests executed', 'All defects fixed and re-tested', 'Code style standard enforced', 'Test coverage threshold met', 'C', 'Test Management'),
('Which of the following approaches is MOST appropriate for early defect detection in code?', 'System testing after release', 'Unit testing and code review', 'User acceptance testing only', 'Regression testing only', 'B', 'Test Levels'),
('What does the term "test oracle" mean?', 'A test automation tool', 'A source to determine whether the test has passed or failed', 'A method to generate test data', 'A test environment', 'B', 'Fundamentals'),
('Which of these is a benefit of test automation?', 'Automating all tests guarantees no defects', 'Frees testers to perform exploratory testing and increases repeatability', 'Replaces the need for test design', 'Removes the need for a test environment', 'B', 'Test Tools'),
('When should acceptance testing ideally be performed?', 'During unit testing', 'After system testing and before release to the customer', 'Only after release', 'Before integration testing', 'B', 'Test Levels'),
('What is the purpose of a traceability matrix?', 'To trace defects to developers', 'To map requirements to test cases to ensure coverage', 'To list all test tools', 'To schedule test runs', 'B', 'Test Management'),
('Which of the following is an example of dynamic testing?', 'Code inspection', 'Running test cases on the executable software', 'Requirement walkthrough', 'Static analysis of source code', 'B', 'Test Techniques'),
('What is "equivalence partitioning" used for?', 'Measuring test coverage', 'Reducing the number of test cases by grouping inputs with similar behavior', 'Determining performance thresholds', 'Managing test environments', 'B', 'Test Techniques'),
('Which of these is a typical characteristic of a good test case?', 'Ambiguous steps', 'Has a clear expected result', 'Requires manual setup only', 'Depends on other tests to run', 'B', 'Test Management'),
('What type of defect is found by boundary value analysis?', 'Defects related to transition states', 'Defects occurring near input limits', 'Defects in code comments', 'Defects in deployment scripts', 'B', 'Test Techniques'),
('Which statement about independent testing is true?', 'Independent testing is always done by the developer', 'Independent testing reduces the risk of bias and can improve defect detection', 'Independent testing is unnecessary for small projects', 'Independent testing replaces unit testing', 'B', 'Test Management'),
('Which test type aims to determine how the system performs under expected and peak load conditions?', 'Functional testing', 'Load and performance testing', 'Usability testing', 'Regression testing', 'B', 'Test Types'),
('What is a stub in integration testing?', 'A temporary replacement for a lower-level component not yet available', 'A final version of a module', 'A testing metric', 'A debugging tool', 'A', 'Test Levels'),
('What is the main difference between verification and validation?', 'Verification ensures we built the right product; validation ensures we built the product right', 'Verification checks documents and code; validation checks the product meets user needs', 'They are synonyms', 'Verification is manual only', 'B', 'Fundamentals'),
('Which of the following is an example of static testing?', 'Executing automated tests', 'Reviewing requirement specifications', 'Running performance tests', 'User acceptance testing', 'B', 'Test Techniques'),
('What does defect severity describe?', 'How often the defect occurs', 'The impact of the defect on the system', 'Who introduced the defect', 'The size of the code module', 'B', 'Test Management'),
('Which of the following is a goal of test monitoring and control?', 'To design new software', 'To track test progress and adjust plans if needed', 'To write production documentation', 'To prevent any test failures from happening', 'B', 'Test Management'),
('Which activity is part of test estimation?', 'Choosing programming languages', 'Estimating effort and resources needed for testing', 'Creating deployment pipelines', 'Refactoring code', 'B', 'Test Management'),
('Which technique is most suitable to design tests for user input fields with many valid ranges?', 'State transition testing', 'Equivalence partitioning and boundary value analysis', 'Statement coverage', 'Mutation testing', 'B', 'Test Techniques'),
('What does "defect clustering" mean?', 'All defects are random', 'Defects tend to be concentrated in a few modules', 'Defects only occur in interfaces', 'Defects cluster around test cases', 'B', 'Fundamentals'),
('Which is a responsibility of the test manager?', 'Writing all unit tests', 'Defining the test strategy and managing testing activities', 'Deploying the system to production', 'Authoring the product requirements', 'B', 'Test Management'),
('What is the purpose of configuration management in testing?', 'To develop new features', 'To control versions of testware and ensure reproducible test environments', 'To run tests faster', 'To perform root cause analysis', 'B', 'Test Management'),
('Which of these is a limitation of static analysis?', 'It can detect runtime concurrency issues', 'It cannot find all types of defects, especially those visible only at runtime', 'It always finds false negatives', 'It replaces the need for dynamic testing', 'B', 'Test Techniques'),
('Which statement about exploratory testing is true?', 'It requires no skills', 'It is simultaneous test design, execution and learning, useful for finding unexpected issues', 'It is fully automated', 'It should be used only at the end of the project', 'B', 'Test Techniques'),
('What is the best way to prioritize test cases when time is limited?', 'Run test cases alphabetically', 'Prioritize by risk and business impact', 'Execute only automated tests', 'Run the longest tests first', 'B', 'Test Management'),
('Which of the following is a benefit of using test tools for test execution?', 'They eliminate the need for planning', 'They improve repeatability and speed of test execution', 'They find all defects automatically', 'They are always cheaper than manual testing', 'B', 'Test Tools'),
('What is the purpose of a test environment?', 'To store test metrics', 'To provide the hardware, software and configuration needed to execute tests', 'To manage source code', 'To write test cases', 'B', 'Test Management'),
('What is mutation testing intended to evaluate?', 'The performance of a system', 'The effectiveness of test cases by introducing small changes to the code', 'The usability of the system', 'The configuration management process', 'B', 'Test Techniques'),
('Which of the following is MOST important when designing maintainable automated tests?', 'Hardcode data in tests', 'Use clear locators, modular design and data-driven approaches', 'Make tests extremely long', 'Avoid version control', 'B', 'Test Tools'),
('What is the main aim of risk analysis for testing?', 'To estimate server capacity', 'To identify areas of highest potential loss and prioritize testing accordingly', 'To schedule training', 'To create user manuals', 'B', 'Test Management'),
('Which metric gives the ratio of defects found to defects fixed in a period?', 'Defect density', 'Defect removal efficiency', 'Mean time between failures', 'Test coverage', 'B', 'Test Management'),
('Which of the following BEST describes a test harness?', 'A tool for static analysis', 'A collection of software and test data configured to test a program unit', 'A monitoring dashboard', 'A method for writing requirements', 'B', 'Test Tools'),
('What is the primary purpose of acceptance testing?', 'To check internal module design', 'To determine whether the system meets business requirements and is ready for delivery', 'To execute unit tests', 'To test developer productivity', 'B', 'Test Levels'),
('Which of the following is an example of a structural (white-box) coverage measure?', 'Decision table coverage', 'Statement coverage', 'Equivalence partitioning coverage', 'Usability coverage', 'B', 'Test Techniques'),
('Which process helps ensure testware (test cases, scripts) is not lost over time?', 'Test closure', 'Test configuration management', 'Test monitoring', 'Exploratory testing', 'B', 'Test Management'),
('Which of these is a key attribute of a good test environment configuration?', 'Uncontrolled changes during tests', 'Stable, reproducible and representative of production', 'Always using the developer''s laptop', 'No access control', 'B', 'Test Management'),
('When is smoke testing typically performed?', 'Before deploying to production to check basic readiness of the build', 'Only after UAT', 'Never', 'Only for security tests', 'A', 'Test Levels'),
('Which of the following is true about the test maturity model concept?', 'All organizations start at the highest maturity', 'It helps organizations measure and improve test processes over time', 'It is only about test automation', 'It replaces the need for metrics', 'B', 'Test Management');
