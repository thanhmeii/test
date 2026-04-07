*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME    
${url}    http://demoqa.com/
${Elements}    //h5[contains(text(),'Elements')]
${BookStore}    //h5[contains(text(),'Book Store Application')]
${Forms}    //h5[contains(text(),'Forms')]
${Practice}    //span[contains(text(),'Practice Form')]
${firstname_input}    //input[@id='firstName']
${lastname_input}    //input[@id='lastName']
${Email_input}    //input[@id='userEmail']
${gender_input}    //input[@id='gender-radio-1']
${mobile_input}    //input[@id='userNumber']
${dateofbirth_input}    //input[@id='dateOfBirthInput']
${subject_input}    //input[@id='subjectsInput']
${hobbies_input}    //input[@id='hobbies-checkbox-3']
${picture}    //input[@label='Select picture']
${current_address_input}    //textarea[@id='currentAddress']
${select_state}    //input[@id='react-select-3-input']
${Haryana_stateLocator}    //div[@id='react-select-3-option-2']
${select_city}    //input[@id='react-select-4-input']
${Panipat_cityLocator}    //div[@id='react-select-4-option-1']
${submit}    //button[@id='submit']
${firstname_text}    Trịnh Trần
${lastname_text}    Phương Tuấn
${email_text}    j97@gmail.com
${mobile_num}    0123456789
${input_dob_locator}    //input[@id='dateOfBirthInput']
${dateofbirth_num}    27 Nov 1999
${subject_text}    Eng
${Subject_locator_English}    //div[contains(text(),'English')]
${current_address_text}    Quận 3 Sì Gòn Việt Nam
${input_state}    Haryana
${input_city}    Panipat
${select_month}    //select[@class='react-datepicker__month-select']
${select_year}    //select[@class='react-datepicker__year-select']
${select_dob}    //div[@aria-label='Choose Saturday, November 27th, 1999']
${verify_result}    //div[@class='table-responsive']
${image_src}    ${EXECDIR}\\resource\\img.jpg
${verify_StudentName}    
${verify_StudentEmail}
${verify_Gender}
${verify_Mobile}
${verify_dob}
${verify_subjects}
${verify_hobbies}
${verify_Address}
${verify_State&city}

*** Test Cases ***
TC04-3
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Scroll Element Into View    ${BookStore}
    Click Element    ${Forms}
    Wait Until Element Is Visible    ${Practice}
    Click Element    ${Practice}
    Input Text    ${firstname_input}    ${firstname_text}
    Input Text    ${lastname_input}    ${lastname_text}
    Input Text    ${Email_input}    ${email_text}
    Select Radio Button    gender    Male
    Input Text    ${mobile_input}    ${mobile_num}
    Click Element    ${input_dob_locator}
    Click Element    ${select_month}
    Select From List By Label    ${select_month}    November
    Click Element    ${select_year}
    Select From List By Label    ${select_year}    1999
    Click Element    ${select_dob}
    Click Element    ${subject_input}
    Input Text    ${subject_input}    ${subject_text}
    Click Element    ${Subject_locator_English}
    Click Element    ${hobbies_input}
    Input Text    ${current_address_input}    ${current_address_text}
    Click Element    ${select_state}
    Input Text    ${select_state}    ${input_state}
    Click Element    ${Haryana_stateLocator}
    Click Element    ${select_city}
    Input Text    ${select_city}    ${input_city}
    Click Element    ${Panipat_cityLocator}
    Log To Console    ${image_src}
    Choose File    ${picture}    ${image_src}
    Click Element    ${submit}

    