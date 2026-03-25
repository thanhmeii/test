*** Settings ***
Library    SeleniumLibrary
Library    String


Test Teardown    Close All Browsers
*** Variables ***
${Browser}    CHROME
${url_demoqa}    http://demoqa.com/
${elements_button}   //h5[contains(text(),"Elements")]
${application_button}    //h5[contains(text(),"Book Store Application")]
${checkBox_Button}    //span[contains(text(),'Check Box')]
${checkbox_tree_switcher}    //span[@class='rc-tree-switcher rc-tree-switcher_close']
${select_checkbox_home}    //span[@aria-label='Select Home']
${select_checkbox_download}    //span[@aria-label='Select Downloads']
${Select_checkbox_document}    //span[@aria-label='Select Documents']
${results}    //div[@id='result']
${verify_results}    desktop documents notes commands workspace office react angular veu public private classified general
${verify_results2}    desktop notes commands
*** Test Cases ***
Checkbox_Pratice
    Open Browser    ${url_demoqa}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    1s
    Scroll Element Into View    ${application_button}
    Click Element    ${elements_button}
    Scroll Element Into View    ${checkBox_Button}
    Click Element    ${checkBox_Button}
    Wait Until Element Is Visible    ${checkbox_tree_switcher}
    Click Element    ${checkbox_tree_switcher}
    Click Element    ${select_checkbox_home}
    Click Element    ${select_checkbox_download}
    ${actual_result1}    Get Text    ${results}
    ${actual_result}    Fetch From Right   ${actual_result1}    : 
    Log To Console    ${actual_result}
    # ${new_actual_result}    Catenate    ${actual_result}[0]    ${actual_result}[1]    ${actual_result}[2]    ${actual_result}[3]    ${actual_result}[4]    ${actual_result}[5]    ${actual_result}[6]    ${actual_result}[7]    ${actual_result}[8]    ${actual_result}[9]    ${actual_result}[10]    ${actual_result}[11]    ${actual_result}[12]
    
    # Log To Console    ${new_actual_result}
    # Should Be Equal As Strings    ${new_actual_result}    ${verify_results}
    Should Be Equal    ${actual_result}    ${verify_results}    ignore_case=${True}    strip_spaces=${True}    collapse_spaces=${True}
    Element Attribute Value Should Be    ${select_checkbox_download}    aria-checked    false
    Click Element    ${Select_checkbox_document}
    ${actual_result2}    Get Text    ${results}
    ${actual_result_uncheck_document}    Fetch From Right    ${actual_result2}    :
    Should Be Equal As Strings    ${actual_result_uncheck_document}    ${verify_results2}    ignore_case=${True}    strip_spaces=${True}    collapse_spaces=${True}
