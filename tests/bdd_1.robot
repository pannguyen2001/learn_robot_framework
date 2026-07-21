*** Settings ***
Library    Browser

*** Test Cases ***
BDD: Clicking Get started leads to intro docs
    Given the Playwright home page is open
    When the user clicks the "Get started" link
    Then the URL should go to the intro docs

*** Keywords ***
Given the Playwright home page is open
    New Page    https://playwright.dev/
    Get Title    matches    Playwright

When the user clicks the "Get started" link
    Get Attribute    "Get started"    href    ==    /docs/intro
    Click    "Get started"

Then the URL should go to the intro docs
    Get Url    matches    .*intro
