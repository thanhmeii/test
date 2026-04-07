*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${Browser}    CHROME
${url}    http://demoqa.com/
${element_button}    //h5[contains(text(),'Elements')]
${bookstore}    //h5[contains(text(),'Book Store Application')]
${alert_title}    //h1[contains(text(),'Alerts')]
${Alert_frame&window}    //div[contains(text(),'Alerts, Frame & Windows')]
${Alert_button}    //span[contains(text(),'Alerts')]
${clickbutton_seealert}    //button[@id='alertButton']
${alert_appearafter5s}    //button[@id='timerAlertButton']
${alert_confirmbox}    //button[@id='confirmButton']
${alert_promtboxappear}    //button[@id='promtButton']
${confirm_alert_text}    Do you confirm action?    
${confirm_result}    //span[@id='confirmResult']
${confirm_cancel_alert}    You selected Cancel


*** Test Cases ***
Alert
    Open Browser    ${url}    ${Browser}
    Set Selenium Speed    0.3s
    Maximize Browser Window
    Scroll Element Into View    ${bookstore}
    Click Element    ${element_button}
    Click Element    ${Alert_frame&window}
    Click Element    ${Alert_button}
    Scroll Element Into View    ${alert_title}
    Click Element    ${clickbutton_seealert}
    Handle Alert    action=ACCEPT
    Click Element    ${alert_appearafter5s}
    #Alert Should Be Present    timeout=5S
    Sleep    7S
    Handle Alert    ACCEPT
    Click Element    ${alert_confirmbox}
    Alert Should Be Present    text=${confirm_alert_text}
    Handle Alert    DISMISS
    ${confirmResult_cancel}    Get Text    ${confirm_result}
    Log To Console    ${confirmResult_cancel}
    Should Be Equal As Strings    ${confirmResult_cancel}    ${confirm_cancel_alert}    collapse_spaces=${False}
    Click Element    ${alert_promtboxappear}
    Input Text Into Alert    text=J97
    Alert Should Be Present    text=you enter J97
    
