*** Keywords ***
Input Textbox
    [Arguments]    ${name}    ${value}
    Fill Text
    ...    role=textbox[name=${name}]
    ...    ${value}

Input Secret
    [Arguments]    ${name}    ${value}
    Fill Secret
    ...    role=textbox[name="${name}"]
    ...    $value
