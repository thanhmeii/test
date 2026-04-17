*** Settings ***
Library    SeleniumLibrary
Library    String

*** Test Cases ***
For In
    @{animals_list}    Create List    Cat    Dog    Kitten    Puppy    J97   
    FOR    ${i}    IN    @{animals_list}
        Log To Console    ${i}
    END
For In Range 1
    FOR    ${index}    IN RANGE    10
        Log To Console    ${index}
    END
For In Range 2
    FOR    ${index}    IN RANGE    1    10
        IF    ${index} == 5
            Log To Console    ${index}
        END
          
    END

Loop Dictionary
    &{HLE}    Create Dictionary    TOP=Zeus    Jungle=Kanavi    Mid=Zeka    Bottom=Guma    Support=Delight
    FOR    ${key}    IN    @{HLE}
        Log To Console    ${HLE}[${key}]
    END

Enumarate
    @{list}    Create List    1    3    5    7
    FOR    ${index}    ${items}    IN ENUMERATE    @{list}
        Log To Console    ${index}value${items}
        
    END
    


    
        