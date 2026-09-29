*** Settings ***
Variables         ../../../configs/env_variables.py
Resource         ../../../resources/locators/locators.robot
Library    DateTime
Library    OperatingSystem

Documentation     This is a page object for Register page.


*** Variables ***
${REGISTER_URL}         ${BASE_URL}/signup
${REGISTER_BUTTON}      xpath=//button[contains(text(),'Đăng kí')]
${COMPLETE_BUTTON}      xpath=//button[contains(text(),'Hoàn thành')]


*** Keywords ***
Open Register Page
    [Documentation]    Open register page.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${REGISTER_URL}
    Wait For Elements State    ${REGISTER_BUTTON}    visible

Fill Register Form
    [Documentation]    Fill register form with given email and password.
    [Arguments]    ${role}    ${full_name}    ${email}    ${password}
    Check Checkbox    css=#${role}
    Fill Text    css=#full_name           ${full_name}
    Fill Text    css=#date_of_birth       2000-01-01
    Check Checkbox   css=#nam
    Fill Text    css=#address             auto_ui_test_address
    Fill Text    css=#email               ${email}
    Fill Text    css=#phone_number        0123456789
    Fill Text    css=#password            ${password}
    Fill Text    css=#confirmPassword     ${password}

Fill Parent Info Form
    [Documentation]    Fill parent info with given email and password.
    ${TODAY}=    Get Current Date    result_format=%Y-%m-%d%H-%M-%S
    Fill Text    css=#parent_name           auto_ui_test_parent_${TODAY}
    Fill Text    css=#parent_phone_number       1234567890

Fill Academic Info Form
    [Documentation]    Fill academic info.
    Click    css=#submit

Register New User
    [Documentation]    Register new user with given email and password.
    [Arguments]    ${role}    ${full_name}    ${email}    ${password}
    Fill Register Form    ${role}    ${full_name}    ${email}    ${password}
    Click    ${REGISTER_BUTTON}
    IF    $role == "student"
        Wait For Elements State    css=#parent_name    visible
        Get URL    ends    completeInfoStudent
        Fill Parent Info Form
        Click    ${COMPLETE_BUTTON}
    ELSE IF    $role == "teacher"
        Fill Academic Info Form
    END
