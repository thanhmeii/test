*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${Browser}    CHROME
${url}    https://the-internet.herokuapp.com/dynamic_loading/1
${Start_Button}    //button[contains(text(),'Start')]
${Loading}    //div[@id='loading']
${finish}    //div[@id='finish']
${verify_text}    Hello World!

*** Test Cases ***
Waittest
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    1s
    Click Element    ${Start_Button}
    Wait Until Element Is Visible    ${Loading}
    Wait Until Element Is Not Visible    ${Loading}
    Wait Until Element Contains    ${finish}    ${verify_text}    timeout=10s

