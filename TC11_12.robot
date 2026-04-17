*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    https://demoqa.com/
${url_tooltips}    https://demoqa.com/tool-tips
${element_button}   //h5[contains(text(),'Elements')] 
${bookstore_button}    //h5[contains(text(),'Book Store Application')]
${buttons}    //span[contains(text(),'Buttons')]
${Elements_Buttons_DoubleClick}    //button[@id='doubleClickBtn']
${Elements_Buttons_RightClick}    //button[@id='rightClickBtn']
${verifyMessage_DoubleClick}    //p[@id='doubleClickMessage']
${verifyMessage_RightClick}    //p[@id='rightClickMessage']

${tooltips_button_Hover}   //button[@id='toolTipButton']
${Tooltip_Inner}    //div[@class='tooltip-inner']


${verifyText_DoubleClick}    You have done a double click
${verifyText_RightClick}    You have done a right click
${Tootip_Inner_Message}    You hovered over the Button

*** Test Cases ***
TC11-12
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Scroll Element Into View    ${bookstore_button}
    Click Element    ${element_button}
    #[Timeout]    5s
    Click Element    ${buttons}
    Double Click Element    ${Elements_Buttons_DoubleClick}
    Element Text Should Be    ${verifyMessage_DoubleClick}    ${verifyText_DoubleClick}
    Mouse Over    ${Elements_Buttons_RightClick}
    Open Context Menu    ${Elements_Buttons_RightClick}
    Element Text Should Be    ${verifyMessage_RightClick}    ${verifyText_RightClick}
    
    Go to     ${url_tooltips}
    Mouse Over    ${tooltips_button_Hover}
    Element Text Should Be    ${Tooltip_Inner}    ${Tootip_Inner_Message}


