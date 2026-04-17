*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url_frame}    http://demoqa.com/frames
${url_nestedFrame}    http://demoqa.nestedframes   
${nestedFrame_button}    //span[contains(text(),'Nested Frames')] 
${modal_dialog_button}    //span[contains(text(),'Modal Dialogs')]
${Frames_heading_frame1}    //iframe[@id='frame1']
${frame_Frame1}    //iframe[@id='frame1']
${Frame1_verifyText}    //h1[contains(text(),'sample page')]
${frame_Frame2}    //iframe[@id='frame2']
${nestedFrame_Parent}    //iframe[@id='frame1']
${nestedFrame_parentFrame_textverify}    //body[contains(text(),'Parent frame')]
${nestedFrame_childFrame}    //iframe[@srcdoc='<p>Child Iframe</p>']
${nestedFrame_childFrame_textverify}    //p[contains(text(),'Child Iframe')]

${verifyText}    This is a sample page
${verifyText_parentFrame}    Parent frame
${verifyText_childFrame}    Child Iframe
${verifyText_NestedFrame}    Nested frame

*** Test Cases ***
Frames
    Open Browser    ${url_frame}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Select Frame    ${frame_Frame1}
    ${GetText_frame1}    Get Text    ${Frame1_verifyText}
    Should Be Equal As Strings    ${GetText_frame1}    ${verifyText}
    Unselect Frame

    Select Frame    ${frame_Frame2}
    ${getText_frame2}    Get Text    ${Frame1_verifyText}
    Should Be Equal As Strings    ${getText_frame2}    ${verifyText}
    Unselect Frame
    
    Scroll Element Into View    ${modal_dialog_button}
    Click Element    ${nestedFrame_button}
    Select Frame   ${nestedFrame_Parent}
    ${getText_nestedframe_Parent}    Get Text    ${nestedFrame_parentFrame_textverify}
    Should Be Equal As Strings    ${getText_nestedframe_Parent}    ${verifyText_parentFrame}
    #Unselect Frame

    Select Frame    ${nestedFrame_childFrame}
    ${getText_nestedframe_Child}    Get Text    ${nestedFrame_childFrame_textverify}
    Should Be Equal As Strings    ${getText_nestedframe_Child}    ${verifyText_childFrame}
    Unselect Frame



