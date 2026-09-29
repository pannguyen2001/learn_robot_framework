*** Settings ***
Variables         ../../../configs/env_variables.py
Resource         ../../../resources/locators/locators.robot

Documentation     This is a page object for Finding teacher page.


*** Variables ***
${SEARCH_BOX}              role=textbox[name="Tìm kiếm giáo viên"]
${FINDING_TEACHER_LINK}    role=link[name="Tìm kiếm giáo viên"]


*** Keywords ***
Go To Finding Teachers Page
    [Documentation]    Go to Finding teacher page.
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1280, 'height': 720}
    New Page       ${BASE_URL}
    Click    ${FINDING_TEACHER_LINK}
    Wait For Elements State    ${SEARCH_BOX}    visible
    Get URL    ends    findingTeacher

Search Value
    [Documentation]    Search value.
    [Arguments]    ${value}
    Fill Text    ${SEARCH_BOX}    ${value}
    ${elements}=      Get Elements    div.card-content.teacher-short-info-left_card-content
    RETURN    ${elements}
