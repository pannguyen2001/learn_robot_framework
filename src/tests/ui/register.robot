*** Settings ***
Resource          ../../resources/pages/common/register_page.resource
Resource          ../../resources/pages/common/login_page.resource
Suite Teardown    Close Browser

Documentation     This is a test suite for register functionality.


*** Test Cases ***
Register New Student User
    [Documentation]    Register new student user.
    Open Register Page
    ${TODAY}=                Get Current Date    result_format=%Y-%m-%d%H-%M-%S
    VAR    ${STUDENT_FULL_NAME}=     auto_ui_test_student_${TODAY}
    VAR    ${STUDENT_EMAIL}=        auto_ui_test_student_${TODAY}@test.com
    VAR    ${PASSWORD}=        123456789
    Register New User    student    ${STUDENT_FULL_NAME}    ${STUDENT_EMAIL}    ${PASSWORD}
    Wait For Elements State    ${LOGIN_BUTTON}    visible
    Submit Credentials    ${STUDENT_EMAIL}    ${PASSWORD}
    # Assert (Then)
    Dashboard Should Be Visible
    # Tear down
    Logout

Register New Teacher User
    [Documentation]    Register new teacher user.
    Open Register Page
    ${TODAY}=                Get Current Date    result_format=%Y-%m-%d%H-%M-%S
    VAR    ${TEACHER_FULL_NAME}=     auto_ui_test_teacher_${TODAY}
    VAR    ${TEACHER_EMAIL}=        auto_ui_test_teacher_${TODAY}@test.com
    VAR    ${PASSWORD}=        123456789
    Register New User    teacher    ${TEACHER_FULL_NAME}    ${TEACHER_EMAIL}    ${PASSWORD}
    Wait For Elements State    ${LOGIN_BUTTON}    visible
    Submit Credentials    ${TEACHER_EMAIL}    ${PASSWORD}
    # Assert (Then)
    Dashboard Should Be Visible
    # Tear down
    Logout
