*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url_demoqaLogin}    http://demoqa.com/login
${url_demoqa_practiceForm}    https://demoqa.com/automation-practice-form

${verifyText_Login}    Login in Book Store
${verifyText_practiceForm}    Student Registration Form

*** Test Cases ***
Switch_Windows
    Open Browser    ${url_demoqaLogin}    ${browser}
    Page Should Contain    ${verifyText_Login}
    Open Browser   ${url_demoqa_practiceForm}    ${browser}
    #Switch Window    NEW
    Page Should Contain    ${verifyText_practiceForm}
    Switch Browser    1
    Page Should Contain    ${verifyText_Login}
