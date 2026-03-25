*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    https://www.tutorialspoint.com/selenium/practice/check-box.php
${Checkbox_MainLevel1}    //input[@id='c_bs_1']
${Checkbox_MainLevel2}    //input[@id='c_bs_2']

*** Test Cases ***
Checkbox_Defalt
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1s
    Select Checkbox    ${Checkbox_MainLevel1}
    Checkbox Should Be Selected    ${Checkbox_MainLevel1}
    Unselect Checkbox    ${Checkbox_MainLevel1}
    Checkbox Should Not Be Selected    ${Checkbox_MainLevel1}
    Select Checkbox    ${Checkbox_MainLevel1}
    Select Checkbox    ${Checkbox_MainLevel2}
    Checkbox Should Be Selected    ${Checkbox_MainLevel1}
    Checkbox Should Be Selected    ${Checkbox_MainLevel2}

