*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/ixigo_flight_filter_locators.robot

*** Keywords ***
Click Non-Stop Filter
    [Documentation]    Click the Non Stop filter to show only non-stop flights
    Wait Until Element Is Visible    ${FILTER_SECTION}    10s
    Scroll Element Into View    ${NON_STOP_FILTER}
    # Wait Until Element Is Visible    ${NON_STOP_FILTER}    10s
    Click Element    ${NON_STOP_FILTER}
    Sleep    2s

Verify Flights Are Non Stop
    ${flights}=    Get WebElements    xpath=//div[contains(@class,'listingContainer')]

    FOR    ${flight}    IN    @{flights}
        ${text}=    Get Text    ${flight}
        Should Contain    ${text}    Non-stop
    END
    
Click Price Filter
    [Documentation]    Click the Price filter to sort flights by price
    # Wait Until Element Is Visible    ${PRICE_FILTER}    10s
    Click Element    ${PRICE_FILTER}
    Sleep    2s