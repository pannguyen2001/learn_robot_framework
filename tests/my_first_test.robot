*** Settings ***
Documentation    My first test
Library          String

*** Keywords ***

*** Variables ***

*** Test Cases ***
Create A Random String
    [Tags]            demo2
    Log To Console    We are going to generate a random string
    Generate Random String  10
    Log To Console    We finished generating a random string
