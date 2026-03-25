*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers
*** Variables ***
${Browser}    CHROME
${url}    http://demoqa.com/
${element_button}    //h5[contains(text(),'Elements')]/..
${radio_button}    //span[contains(text(),'Radio Button')]
${no_radio}    //input[@id='noRadio']
${no_label}    //input[@id='noRadio']/following-sibling::label
${yes_radio}    //input[@id='yesRadio']
${impressive_radio}    //input{@id='impressiveRadio'}
${verify_result}    //span[@class='text-success']
${Verify_resultText_Yes}    Yes
${verify_resultText_Impressive}    Impressive


*** Test Cases ***
TC_RadioButton
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.5s
    Scroll Element Into View    ${element_button}
    Click Element    ${element_button}
    Scroll Element Into View    ${radio_button}
    Click Element    ${radio_button}
    Element Attribute Value Should Be    ${no_radio}    class    form-check-input disabled
    Element Attribute Value Should Be    ${no_label}    class    form-check-input disabled
    Click Element    ${yes_radio}
    ${verify_result_yes}    Get Text    ${verify_result}
    Should Be Equal    ${verify_result_yes}    ${Verify_resultText_Yes}
    Click Element    ${impressive_radio}
    ${verify_result_impressive}    Get Text    ${verify_result}
    Should Be Equal    ${verify_result_impressive}    ${verify_resultText_Impressive}
       