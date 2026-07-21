*** Settings ***
Documentation    My second test
Library          String

*** Variables ***
${MY-VARIABLE}            my test variable
@{LIST}                   list1    list2    list3
&{DICTIONARY}             username=username  pw=pw

*** Test Cases ***
Test
    [Tags]                demo  demo2
    Log to console        This is second test ${MY-VARIABLE}
Test2
    Log to console        All list items: @{LIST}
    Log to console        First list item by index: ${LIST}[0]
    Log to console        All dict items: &{DICTIONARY}
    Log to console        Dict value by key (scalar): ${DICTIONARY}[username]
    Log to console        Dict value by key (dict): ${DICTIONARY}[pw]
