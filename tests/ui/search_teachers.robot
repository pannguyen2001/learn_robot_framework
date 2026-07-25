*** Settings ***
Variables         ../../resources/env_variables.py
Resource          ../../locators/locators.robot
Resource          ../../resources/ui/finding_teacher_page.robot
Suite Teardown    Close Browser


*** Test Cases ***
Get all teachers
    [Documentation]    Get all teachers.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    test_user
    Length Should Be     ${teacher_cards}    5

Search existed teacher
    [Documentation]    Search existed teacher.
    Go To Finding Teachers Page
    # Log To Console    ${USER_ACCOUNTS}
    ${teacher_cards}=      Search value    ${USER_ACCOUNTS}[teacher_01][username]
    Length Should Be     ${teacher_cards}    1

Search non-existed teacher
    [Documentation]    Search non-existed teacher.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    ${USER_ACCOUNTS["student_01"]["username"]}
    Length Should Be     ${teacher_cards}    0
