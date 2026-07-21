*** Settings ***
Library    Browser
Suite Teardown    Close Browser


*** Variables ***
${BASE_URL}          https://datn-fe-sooty.vercel.app
${SEARCH_BOX}    role=textbox[name="Tìm kiếm giáo viên"]
${FINDING_TEACHER_LINK}    role=link[name="Tìm kiếm giáo viên"]


*** Keywords ***
Go To Finding Teachers Page
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}
    Click    ${FINDING_TEACHER_LINK}
    Wait For Elements State    ${SEARCH_BOX}    visible
    Get URL    ends    findingTeacher

Search value
    [Arguments]    ${value}
    Fill Text    ${SEARCH_BOX}    ${value}
    ${elements}=      Get Elements    div.card-content.teacher-short-info-left_card-content
    RETURN    ${elements}


*** Test Cases ***
Search teachers
    [Documentation]    Search teachers.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    test_user
    Length Should Be     ${teacher_cards}    5

Search existed teacher
    [Documentation]    Search existed teacher.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    test_user_03
    Length Should Be     ${teacher_cards}    1

Search non-existed teacher
    [Documentation]    Search non-existed teacher.
    Go To Finding Teachers Page
    Fill Text    ${SEARCH_BOX}    test_user_01
    ${teacher_cards}=      Search value    test_user_01
    Length Should Be     ${teacher_cards}    0
