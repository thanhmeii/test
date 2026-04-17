*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url_demoqa}    http://demoqa.com/
${url_tutalrialspoint}    https://www.tutorialspoint.com/selenium/practice/check-box.php

${AlertFrame&Windows_button}    //h5[contains(text(),'Alerts, Frame & Windows')]
${bookstore}    //h5[contains(text(),'Book Store Application')]
${element_Button_BrowserWindows}    //span[contains(text(),'Browser Windows')]
${element_Button_Forms}    //div[contains(text(),'Forms')]
${element_BrowserWindow_Newtab_button}    //button[@id='tabButton']
${Newtab_heading}    //h1[@id='sampleHeading']
${tutorialpage_Checkbox_heading}    //h1[contains(text(),'Selenium')]

${newtab_heading_text}    This is a sample page
${tutorialpage_Checkbox_heading_text}    Selenium - Automation Practice Form

*** Test Cases ***
Switch Browsers
    Open Browser    ${url_demoqa}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Scroll Element Into View    ${bookstore}
    Click Element    ${AlertFrame&Windows_button}
    Scroll Element Into View    ${element_Button_Forms}
    Click Element    ${element_Button_BrowserWindows}
    Click Element    ${element_BrowserWindow_Newtab_button}
    Switch Window    NEW
    Go To    ${url_tutalrialspoint}
    Switch Window    MAIN
    Click Element    ${element_BrowserWindow_Newtab_button}
    Switch Window    NEW
    Page Should Contain    ${newtab_heading_text}
    Close Window
    Switch Window    url=${url_tutalrialspoint}
    Page Should Contain    ${tutorialpage_Checkbox_heading_text}



