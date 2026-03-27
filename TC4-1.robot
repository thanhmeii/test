*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    http://demoqa.com/
${widgets_button}    //h5[contains(text(),'Widgets')]
${BookstoreApplication_Button}    //h5[contains(text(),'Book Store Application')]
${SelectValue_text}    //div[contains(text(),'Select Value')]
${SelectMenu}    //span[contains(text(),'Select Menu')]
${SelectMenu_Group1_Option2}
${SelectValue}    //input[@id='react-select-2-input']/../../..
${SelectOne}    //input[@id='react-select-3-input']/../../..
${OldStyle_SelectMenu}    //select[@id='oldSelectMenu']
${MultiSelect_Dropdown}    //input[@id='react-select-4-input']/../../..
${verify_selected_value}    Group 1, option 2
${verify_selected_one_locator}    //input[@id='react-select-3-input']/../..//div[@class='css-1dimb5e-singleValue']
${verify_selected_one_text}    Dr.
${verify_seleted_multidrop}    Green Blue
${click_space}    //b[contains(text(),'Multiselect drop down')]
${multidropdown_Green}    //div[contains(text(),'Green')]
${multidropdown_Blue}    //div[contains(text(),'Blue')]



*** Test Cases ***
Dropdown_list_custom
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    1s
    Scroll Element Into View    ${BookstoreApplication_Button}
    Click Element    ${widgets_button}
    Click Element    ${SelectMenu}
    Scroll Element Into View    ${SelectValue_text}
    Click Element    ${SelectValue}
    Press Keys    None    ARROW_DOWN
    Press Keys    None    ENTER
    ${verify_text_result_SelectValue}    Get Text    ${SelectValue}
    Should Be Equal As Strings    ${verify_text_result_SelectValue}    ${verify_selected_value}
    Click Element    ${SelectOne}
    Press Keys    None    ENTER
    ${verify_text_result_selectOne}    Get Text    ${verify_selected_one_locator}
    Should Be Equal As Strings    ${verify_text_result_selectOne}    ${verify_selected_one_text}
    Click Element    ${OldStyle_SelectMenu}
    Select From List By Label    ${OldStyle_SelectMenu}    Green
    List Selection Should Be    ${OldStyle_SelectMenu}    Green
    Click Element    ${click_space}
    Click Element    ${MultiSelect_Dropdown}
    Wait Until Element Is Visible    ${multidropdown_Blue}
    Click Element    ${multidropdown_Green}
    Click Element    ${multidropdown_Blue}
    Click Element    ${click_space}
    ${verify_text_result_Selectmulti}    Get Text    ${MultiSelect_Dropdown}
    Log To Console    ${verify_text_result_Selectmulti}
    Should Be Equal As Strings    ${verify_text_result_Selectmulti}    ${verify_seleted_multidrop}    collapse_spaces=${TRUE}




