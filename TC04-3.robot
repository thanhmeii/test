*** Settings ***
Library    SeleniumLibrary
Library    String

Test Teardown    Close All Browsers

*** Variables ***
${Browser}    CHROME
${url}    http://demoqa.com/
${Element}
${Forms}
${Alerts,Frame&Windows}
${PracticeForm}
${FirstName}
${LastName}
${Email}
${Gender}
${MobileNumber}
${DateOfBirth}
${Subject}
${Hobbies}
${Picture}
${CurrentAddress}
${SelectState}
${SelectCity}
${Submit}
${Verify_StudentName}
${Verify_Email}
${Verify_Gender}
${Verify_Mobile}
${Verify_Birthday}
${Verify_Subject}
${Verify_Hobbies}
${Verify_Picture}
${Verify_Address}
${Verify_StateAndCity}