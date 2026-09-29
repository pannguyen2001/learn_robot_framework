*** Settings ***
Resource         ../../resources/pages/common/login_page.resource
Suite Teardown    Close Browser

Documentation     This is a test suite for login functionality.


*** Variables ***
${ADMIN_INFO}        ${USER_ACCOUNTS}[admin_01]
${TEACHER_INFO}      ${USER_ACCOUNTS}[teacher_01]
${STUDENT_INFO}      ${USER_ACCOUNTS}[student_01]


*** Test Cases ***
Login As Admin Successfully
    [Documentation]    Given a registered user, When they submit valid credentials, Then they reach the dashboard
    # Arrange (Given)
    Open Login Page
    # Act (When)
    Submit Credentials    ${ADMIN_INFO}[email]    ${ADMIN_INFO}[password]
    # Assert (Then)
    Assert Login As Admin Successfully
    # Tear down
    Logout

Login As Teacher Successfully
    [Documentation]    Given a registered user, When they submit valid credentials, Then they reach the dashboard
    # Arrange (Given)
    Open Login Page
    # Act (When)
    Submit Credentials    ${TEACHER_INFO}[email]    ${TEACHER_INFO}[password]
    # Assert (Then)
    Dashboard Should Be Visible
    # Tear down
    Logout

Login As Student Successfully
    [Documentation]    Given a registered user, When they submit valid credentials, Then they reach the dashboard
    # Arrange (Given)
    Open Login Page
    # Act (When)
    Submit Credentials    ${STUDENT_INFO}[email]    ${STUDENT_INFO}[password]
    # Assert (Then)
    Dashboard Should Be Visible
    # Tear down
    Logout
