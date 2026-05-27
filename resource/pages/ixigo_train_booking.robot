*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/ixigo_train_booking_locators.robot

*** Keywords ***
Click Book Button
    [Documentation]    Click the "Book" button for a train in the search results
    Wait Until Element Is Visible    ${AVAILABLE_SEATS}    20s
    Scroll Element Into View         ${AVAILABLE_SEATS}
    Click Element                    ${AVAILABLE_SEATS}

    Wait Until Element Is Visible    ${BOOK_BUTTON}    20s
    Scroll Element Into View         ${BOOK_BUTTON}
    Click Element                    ${BOOK_BUTTON}

    Sleep    2s
    
Add Passenger Details
    [Documentation]    Add passenger details in the booking form
    [Arguments]    ${Name}    ${Age}
    Wait Until Element Is Visible    ${ADD_PASSENGER_DIALOG}    10s
    Input Text    ${FULL_NAME_FIELD}    ${Name}
    Input Text    ${AGE_FIELD}    ${Age}
    Click Element    ${GENDER}
    Click Element    ${BERTH_PREFERENCE}
    Click Element    ${UPPER_BERTH_LOC}
    Click Element    ${SAVE_PASSENGER_BUTTON}
    Sleep    2s
    
Proceed To Payment
    [Documentation]    Click the "Proceed to Pay" button after adding passenger details
    Scroll Element Into View    ${PROCEED_TO_PAY_BUTTON}
    Click Element    ${PROCEED_TO_PAY_BUTTON}
    Sleep    2s
    Wait Until Element Is Visible    ${ADD_IRCTC_ID_DIALOG}    10s
    Log To Console    Proceeded to payment successfully