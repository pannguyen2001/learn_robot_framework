*** Settings ***
Variables         ../../configs/env_variables.py
Resource          ../../resources/locators/locators.robot
Resource          ../../resources/pages/common/finding_teacher_page.resource
Suite Teardown    Close Browser

Documentation     This is a test suite for searching teachers functionality.


*** Test Cases ***
Get all teachers
    [Documentation]    Get all teachers.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search Value    test_user
    Length Should Be     ${teacher_cards}    5

Search existed teacher
    [Documentation]    Search existed teacher.
    Go To Finding Teachers Page
    # Log To Console    ${USER_ACCOUNTS}
    ${teacher_cards}=      Search Value    ${USER_ACCOUNTS}[teacher_01][username]
    Length Should Be     ${teacher_cards}    1

Search non-existed teacher
    [Documentation]    Search non-existed teacher.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search Value    ${USER_ACCOUNTS["student_01"]["username"]}
    Length Should Be     ${teacher_cards}    0
