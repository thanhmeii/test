*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${url_demoqa}    https://demoqa.com/
${browser}    CHROME
${element_button}   //h5[contains(text(),'Elements')] 
${bookstore_button}    //h5[contains(text(),'Book Store Application')]

*** Test Cases ***
TC10
    Open Browser    ${url_demoqa}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Scroll Element Into View    ${bookstore_button}
    Click Element    ${element_button}
    ${demoqa_element_url}    Get Location
    Go Back
    ${url_after_goback}    Get Location
    Log To Console    ${url_after_goback}
    Should Be Equal    ${url_after_goback}    ${url_demoqa}    ignore_case=${False}    strip_spaces=${False}    collapse_spaces=${False}
