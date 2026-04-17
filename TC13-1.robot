*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${browser}    CHROME
${url}    https://demoqa.com/books
${Bookstore_title_list}    //a[contains(@href,'books?search')]

*** Test Cases ***
ForLoop
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Sleep    3s

    ${total}    Get Element Count    ${Bookstore_title_list}
    # @{titles}    Get WebElements    ${Bookstore_title_list}
    
    FOR    ${i}    IN RANGE    ${total}
        ${j}    Evaluate    ${i}+1
        ${title}    Get Text    (${Bookstore_title_list})[${j}]
        Log To Console    ${title}
    END

TC13-2
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${Bookstore_title_list}

    @{titles}    Get WebElements    ${Bookstore_title_list}
    FOR    ${items}    IN    @{titles}
        ${titles_book}    Get Text    ${items}
        Log To Console    ${titles_book}
    END
    
    FOR    ${i}    IN    @{titles}
        ${book_attributes_innerText}    Get Element Attribute    ${i}    attribute=innerText
        # ${innerText_Attribute_Titles}    Get Text   ${i}
        Log To Console    ${book_attributes_innerText}
    END
    
        
        

