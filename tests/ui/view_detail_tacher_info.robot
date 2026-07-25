*** Settings ***
Variables         ../../resources/env_variables.py
Resource         ../../locators/locators.robot
Resource         ../../resources/ui/finding_teacher_page.robot
Library    Browser
Suite Teardown    Close Browser


*** Variables ***
${SEARCH_BOX}    role=textbox[name="Tìm kiếm giáo viên"]
${FINDING_TEACHER_LINK}    role=link[name="Tìm kiếm giáo viên"]
${DETAIL_BUTTON}=    xpath=//button[contains(@class,"button mt-4")]
${TEACHER_ACCOUNT_INFO}=    ${USER_ACCOUNTS}[teacher_01]
${TEACHER_NAME}=    css=strong.is-size-4.mb-4


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

Go To Detail Teacher Page
    Click    ${DETAIL_BUTTON}
    Get URL    contains    detailTeacher
    ${class_name}=    Get Text     xpath=//tr[td[contains(., 'Học chính thức')]]//td[2]
    RETURN    ${class_name}

Go To Detail Course Page
    [Arguments]    ${course_type}
    ${DETAIL_COURSE_BUTTON}=    Set Variable    xpath=//tr[td[1][contains(., ${course_type})]]//td[6]//button
    Wait For Elements State    ${DETAIL_COURSE_BUTTON}    visible
    Click    ${DETAIL_COURSE_BUTTON}
    Get URL    contains    detailClass
    ${course_name}=    Get Text    css=strong.is-size-5
    RETURN     ${course_name}

Assert Detail Class Page
    [Arguments]    ${actual_result}    ${expected_result}
    Log To Console     expected_class_name: ${expected_result}
    Log To Console     actual_class_name: ${actual_result}
    Should Be Equal     ${actual_result}     ${expected_result}

Back To Detail Teacher Page
    ${exit_button}=     Set Variable    role=button[name="Thoát"]
    Wait For Elements State    ${exit_button}    visible
    Click    ${exit_button}
    Wait For Elements State    ${TEACHER_NAME}    visible
    Get URL    contains    detailTeacher


*** Test Cases ***
View official course detail
    [Documentation]    View official course detail.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    ${TEACHER_ACCOUNT_INFO}[username]
    ${official_class_name}=    Go To Detail Teacher Page
    ${actual_course_name}=    Go To Detail Course Page    "Học chính thức"
    Assert Detail Class Page    ${actual_course_name}    ${official_class_name}
    Back To Detail Teacher Page

View demo course detail
    [Documentation]    View official course detail.
    Go To Finding Teachers Page
    ${teacher_cards}=      Search value    ${TEACHER_ACCOUNT_INFO}[username]
    ${demo_class_name}=    Go To Detail Teacher Page
    ${actual_course_name}=     Go To Detail Course Page    'Học thử'
    Assert Detail Class Page    ${actual_course_name}    ${demo_class_name}
    Back To Detail Teacher Page
