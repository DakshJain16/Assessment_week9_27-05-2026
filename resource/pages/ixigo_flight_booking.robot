*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/ixigo_flight_booking_locators.robot

*** Keywords ***
Book A Flight
    Click Element    ${BOOK_FLIGHT_BUTTON}
    Wait Until Page Contains Element    ${REVIEW_DETAILS_CARD}    10s

Safe Click
    [Arguments]    ${locator}

    Wait Until Element Is Visible    ${locator}    10s
    Scroll Element Into View         ${locator}
    Sleep    1s

    TRY
        Click Element    ${locator}
    EXCEPT
        ${element}=    Get WebElement    ${locator}

        Execute JavaScript
        ...    arguments[0].click();
        ...    ARGUMENTS    ${element}
    END

Add Cancellation
    Safe Click    ${FREE_CANCELLATION_BUTTON}

Add Details
    [Arguments]    ${first_name}    ${last_name}

    Scroll Element Into View    ${TRAVELLER_DETAILS_SECTION}

    Safe Click    ${TITLE_FIELD}
    Safe Click    ${TITLE}

    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}     ${last_name}

Add Contact Details
    [Arguments]    ${email}

    Scroll Element Into View    ${CONTACT_DETAILS_SECTION}

    Input Text    ${EMAIL_FIELD}    ${email}

Review Details
    Safe Click    ${CONTINUE_BUTTON}
    Wait Until Element Is Visible    ${CONFIRM_BUTTON}    10s
    Safe Click    ${CONFIRM_BUTTON}

Move To Payment Section
    Wait Until Element Is Visible    ${ADD_ON_SECTION}    10s
    Click Element    ${SKIP_TO_PAYMENT_BUTTON}
    Wait Until Page Contains Element    ${FARE_SUMMARY}    10s

