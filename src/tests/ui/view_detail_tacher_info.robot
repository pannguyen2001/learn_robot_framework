*** Settings ***
Variables         ../../configs/env_variables.py
Resource          ../../resources/locators/locators.robot
Resource          ../../resources/pages/common/finding_teacher_page.resource
Resource          ../../resources/pages/common/view_detail_teacher_page.resource
Suite Teardown    Close Browser

Documentation     This is a test suite for view detail teachers functionality.


*** Test Cases ***
View official course detail
    [Documentation]    View official course detail.
    Go To Finding Teachers Page
    Search Value    ${TEACHER_ACCOUNT_INFO}[username]
    ${official_class_name}=    Go To Detail Teacher Page
    ${actual_course_name}=    Go To Detail Course Page    "Học chính thức"
    Assert Detail Class Page    ${actual_course_name}    ${official_class_name}
    Back To Detail Teacher Page

View demo course detail
    [Documentation]    View demo course detail.
    Go To Finding Teachers Page
    Search Value    ${TEACHER_ACCOUNT_INFO}[username]
    ${demo_class_name}=    Go To Detail Teacher Page
    ${actual_course_name}=     Go To Detail Course Page    'Học thử'
    Assert Detail Class Page    ${actual_course_name}    ${demo_class_name}
    Back To Detail Teacher Page
