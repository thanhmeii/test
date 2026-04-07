*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${Browser}    CHROME
${url}    https://the-internet.herokuapp.com/dynamic_controls
${Remove_button}    //button[contains(text(),'Remove')]
${Add_button}    //button[contains(text(),'Add')]
${checkbox_button1}    //div[@id='checkbox']
${checkbox2}    //input[@id='checkbox']/..

*** Test Cases ***
Waittime2
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Click Element    ${Remove_button}
    Wait Until Element Is Not Visible    ${checkbox_button1}    timeout=10s
    Element Should Not Be Visible    ${checkbox_button1}
    Click Element    ${Add_button}
    Wait Until Element Is Visible    ${checkbox2}
    Element Should Be Visible    ${checkbox2}


