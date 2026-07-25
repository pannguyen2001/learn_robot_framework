*** Settings ***
Resource         ../../resources/ui/login_page.robot
Suite Teardown    Close Browser

*** Test Cases ***
User logs in with valid credentials
    [Documentation]    Given a registered user, When they submit valid credentials, Then they reach the dashboard
    # Arrange (Given)
    Open Login Page
    # Act (When)
    Submit Credentials    test_user_01@gmail.com    123456789
    # Assert (Then)
    Dashboard Should Be Visible
    # Tear down
    Logout
