*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    http://demoqa.com/
${elements_button}   //h5[contains(text(),"Elements")]
${text_box}    //span[contains(text(),'Text Box')]
${Full_name}    //input[@id='userName']
${Email}    //input[@id='userEmail']
${Current_Address}    //textarea[@id='currentAddress']
${Permanent_Adress}    //textarea[@id='permanentAddress']
${Submit_Button}    //button[@id='submit']
${Results_Name}    //p[@id='name']
${Results_Email}    //p[@id='email']
${Results_CurrentAddress}    //p[@id='currentAddress']
${Results_PermanentAddress}    //p[@id='permanentAddress']
${Ad_plus}    //div[@id='Ad.Plus-970x250-2']

${User_name}    Trinh Tran Phuong Tuan
${User_email}    j97@gmail.com
${User_current_address}    Viet Nam\nHo Chi Minh\nQuan 7
${User_permanent_address}    Viet Nam\nHo Chi Minh\nQuan 7
*** Test Cases ***
TC Ex1
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element    ${elements_button}
    Sleep    2s
    Click Element    ${text_box}
    Wait Until Element Is Visible    ${Full_name}
    Input Text    ${Full_name}    ${User_name}
    Input Text    ${Email}    ${User_email}
    Input Text    ${Current_Address}    ${User_current_address}
    Input Text    ${Permanent_Adress}    ${User_permanent_address}
    Click Button   ${Submit_Button}
    Scroll Element Into View    ${Ad_plus}

    ${verify_name}    Get Text    ${Results_Name}
    ${name}    Fetch From Right    ${verify_name}    :
    Should Be Equal As Strings    ${name}    ${User_name}
    
    ${verify_email}    Get Text    ${Results_Email}
    ${email}    Fetch From Right    ${verify_email}    :
    Should Be Equal As Strings    ${email}    ${User_email}
    
    ${verify_currentAddress}    Get Text    ${Results_CurrentAddress}
    ${current_address}    Fetch From Right    ${verify_currentAddress}    :
    @{split_address}    Split String    ${User_current_address}    \n
    ${new_user_current_address}    Catenate    ${split_address}[0]        ${split_address}[1]        ${split_address}[2]
    Should Be Equal As Strings    ${current_address}    ${new_user_current_address}

    ${verify_permanentAdress}    Get Text    ${Results_PermanentAddress}
    ${permanent_address}    Fetch From Right    ${verify_permanentAdress}    :
    ${split_permanentAddress}    Split String    ${User_permanent_address}    \n
    Log To Console    ${split_permanentAddress}[-1]
    ${new_user_permanent_adress}    Catenate    ${split_permanentAddress}[0]    ${split_permanentAddress}[1]    ${split_permanentAddress}[2]
    Should Be Equal As Strings    ${permanent_address}    ${new_user_permanent_adress}


    