*** Settings ***
Library    Browser

Documentation     This is a page object for locators.


*** Keywords ***
Input Textbox
    [Documentation]    Fill textbox value.
    [Arguments]    ${name}    ${value}
    Fill Text
    ...    role=textbox[name=${name}]
    ...    ${value}

Input Secret
    [Documentation]    Input paswword.
    [Arguments]    ${name}    ${value}
    Fill Secret
    ...    role=textbox[name="${name}"]
    ...    $value
