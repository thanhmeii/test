*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${Browser}    CHROME
${url}    https://demoqa.com/links
${list_link}    //div[@id='linkWrapper']//a

*** Test Cases ***
TC13
    Open Browser    ${url}    ${Browser}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    ${link_count}    Get Element Count    ${list_link}
    FOR    ${i}    IN RANGE    ${link_count}
        ${extract_link}    Get Text    (${list_link})[${i}+1]
        Log To Console    ${extract_link}
    END
    
    