*** Settings ***
Documentation     A basic example test suite using BuiltIn keywords.
# You can import external libraries here (e.g., Library  SeleniumLibrary)

*** Variables ***
${WELCOME_MSG}    Hello, Robot Framework!

*** Test Cases ***
Log A Simple Message Test
    Log To Console    \n${WELCOME_MSG}
    
Compare Basic Numbers Test
    Should Be Equal As Integers    10    10