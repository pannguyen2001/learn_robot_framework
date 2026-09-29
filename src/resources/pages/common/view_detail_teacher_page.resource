*** Settings ***
Variables         ../../../configs/env_variables.py
Resource          ../../../resources/locators/locators.robot
Resource          ../../../resources/pages/common/finding_teacher_page.resource

Documentation     This is a resource for view detail teachers functionality.


*** Variables ***
${SEARCH_BOX}=                role=textbox[name="Tìm kiếm giáo viên"]
${FINDING_TEACHER_LINK}=      role=link[name="Tìm kiếm giáo viên"]
${DETAIL_BUTTON}=             xpath=//button[contains(@class,"button mt-4")]
${TEACHER_ACCOUNT_INFO}=     ${USER_ACCOUNTS}[teacher_01]
${TEACHER_NAME}=             css=strong.is-size-4.mb-4


*** Keywords ***
Go To Detail Teacher Page
    [Documentation]    Go to the detail page for a specific teacher.
    Click    ${DETAIL_BUTTON}
    Get URL    contains    detailTeacher
    ${class_name}=    Get Text     xpath=//tr[td[contains(., 'Học chính thức')]]//td[2]
    RETURN    ${class_name}

Go To Detail Course Page
    [Documentation]    Go to the detail page for a specific course.
    [Arguments]    ${course_type}
    VAR    ${DETAIL_COURSE_BUTTON}    xpath=//tr[td[1][contains(., ${course_type})]]//td[6]//button
    Wait For Elements State    ${DETAIL_COURSE_BUTTON}    visible
    Click    ${DETAIL_COURSE_BUTTON}
    Get URL    contains    detailClass
    ${course_name}=    Get Text    css=strong.is-size-5
    RETURN     ${course_name}

Assert Detail Class Page
    [Documentation]    Assert the detail class page.
    [Arguments]    ${actual_result}    ${expected_result}
    Log To Console     expected_class_name: ${expected_result}
    Log To Console     actual_class_name: ${actual_result}
    Should Be Equal     ${actual_result}     ${expected_result}

Back To Detail Teacher Page
    [Documentation]    Back to the detail teacher page.
    VAR    ${exit_button}    role=button[name="Thoát"]
    Wait For Elements State    ${exit_button}    visible
    Click    ${exit_button}
    Wait For Elements State    ${TEACHER_NAME}    visible
    Get URL    contains    detailTeacher
