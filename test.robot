*** Settings ***
Library    SeleniumLibrary

Suite Setup
suite teardown

Test Setup
Test Teardown

*** Variables ***
${gooole_url}    https://www.google.com/
${browser}    CHROME

${PageName_type_ElementName}    ggjfgdj
${Main_input_SearchBox}    //*[@id="APjFqb"]

*** Test Cases ***
LoginTest
    Open Browser     ${gooole_url}    ${browser}
    Maximize Browser Window
    Click Element    ${Main_input_SearchBox}
    Input Text    //*[@id="APjFqb"]    J97
    Sleep    2s
    Click Element    (//input[@name='btnK'])[1]
    Close Browser

Logout Test
    Log To Console    Logout

*** Keywords ***