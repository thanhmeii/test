*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    https://demoqa.com/dynamic-properties
${enable5s_button}    //button[@id='enableAfter']
${visible5s_button}    //button[@id='visibleAfter']

*** Test Cases ***
waittime_tc
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.5s 
    #Set Browser Implicit Wait    10s
    Wait Until Element Is Enabled    ${enable5s_button}    timeout=10s
    Element Should Be Enabled    ${enable5s_button}
    Reload Page
    #Press Keys    None    F5
    Wait Until Element Is Enabled    ${enable5s_button}
    Wait Until Element Is Visible    ${visible5s_button}
    Element Should Be Visible    ${visible5s_button}
    
