*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close Browser

*** Variables ***
${browser}    CHROME
${url}   https://the-internet.herokuapp.com/dynamic_controls
${enable_button}    //button[contains(text(),'Enable')]
${loading}    //div[@id='loading' and not (@style)]
${textbox}    //form[@id='input-example']//input

*** Test Cases ***
TC5-3
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Click Element    ${enable_button}
    Wait Until Element Is Not Visible    ${loading}
    Wait Until Element Is Enabled    ${textbox}    timeout=10s