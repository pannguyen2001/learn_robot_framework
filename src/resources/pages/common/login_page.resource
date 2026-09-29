*** Settings ***
Variables         ../../../configs/env_variables.py
Resource         ../../../resources/locators/locators.robot
Library    OperatingSystem

Documentation     This is a page object for Login page.


*** Variables ***
${LOGIN_URL}            ${BASE_URL}/login
${LOGIN_BUTTON}         role=button[name="Đăng nhập"]
${LOGOUT_BUTTON}        role=link[name="Đăng xuất"]
${MANAGEMENT_BUTTON}    xpath=//a[contains(text(),'Quản lí')]


*** Keywords ***
Email Input
    [Documentation]    Get email input element.
    ${element}=    Get Element By Role    TEXTBOX    name=Email
    RETURN    ${element}

Open Login Page
    [Documentation]    Open login page.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${LOGIN_URL}
    ${email}=      Email Input
    Wait For Elements State    ${email}    visible

Submit Credentials
    [Documentation]    Login to the page.
    [Arguments]      ${email}    ${password}
    Input Textbox    Email       ${email}
    Input Secret     Mật khẩu    ${password}
    Click         ${LOGIN_BUTTON}

Dashboard Should Be Visible
    [Documentation]    Verify that in Dashboard page.
    Wait For Elements State    ${LOGOUT_BUTTON}    visible
    Get Text    ${LOGOUT_BUTTON}    ==    Đăng xuất

Logout
    [Documentation]    Logout page.
    Click    ${LOGOUT_BUTTON}
    Wait For Elements State    ${LOGIN_BUTTON}    visible
    Get Text    ${LOGIN_BUTTON}    ==    Đăng nhập

Assert Login As Admin Successfully
    [Documentation]    Verify that user is logged in as admin successfully.
    Dashboard Should Be Visible
    Wait For Elements State    ${MANAGEMENT_BUTTON}    visible
