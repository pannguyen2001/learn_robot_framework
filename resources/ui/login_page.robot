*** Settings ***
Variables         ../../resources/env_variables.py
Resource         ../../locators/locators.robot
Library    OperatingSystem
Library    Browser

*** Variables ***
${LOGIN_URL}          ${BASE_URL}/login
${LOGIN_BUTTON}       role=button[name="Đăng nhập"]
${LOGOUT_BUTTON}      role=link[name="Đăng xuất"]

*** Keywords ***
Email Input
    ${element}=    Get Element By Role    TEXTBOX    name=Email
    RETURN    ${element}

Open Login Page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${LOGIN_URL}
    ${email}=      Email input
    Wait For Elements State    ${email}    visible

Submit Credentials
    [Arguments]      ${email}    ${password}
    Input Textbox    Email       test_user_01@gmail.com
    Input Secret     Mật khẩu    123456789
    Click         ${LOGIN_BUTTON}

Dashboard Should Be Visible
    Wait For Elements State    ${LOGOUT_BUTTON}    visible
    Get Text    ${LOGOUT_BUTTON}    ==    Đăng xuất

Logout
    Click    ${LOGOUT_BUTTON}
    Wait For Elements State    ${LOGIN_BUTTON}    visible
    Get Text    ${LOGIN_BUTTON}    ==    Đăng nhập
