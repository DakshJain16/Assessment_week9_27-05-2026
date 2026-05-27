*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/ixigo_navigation_locators.robot

*** Keywords ***
Verify Tabs Are Visible
    [Documentation]    Verifying the visibility of tabs in ixigo navigation bar
    Page Should Contain Element    ${IXIGO_LOGO}
    Log To Console    IXIGO LOGO visible

    Page Should Contain Element    ${FLIGHTS_TAB}
    Log To Console    FLIGHTS TAB visible

    Page Should Contain Element    ${HOTELS_TAB}
    Log To Console    HOTELS TAB visible

    Page Should Contain Element    ${TRAINS_TAB}
    Log To Console    TRAINS TAB visible

    Page Should Contain Element    ${BUSES_TAB}
    Log To Console    BUSES TAB visible

Click Ixigo Logo
    [Documentation]    Redirecting to home page by clicking on ixigo logo

    ${url}=    Get Location

    IF    'buses' in '${url}'
        Click Element    ${IXIGO_LOGO_ON_BUS_PAGE}
        Sleep    2s
        Location Should Be    https://www.ixigo.com/
    ELSE
        Click Element    ${IXIGO_LOGO}
        Sleep    2s
        Location Should Be    https://www.ixigo.com/
    END

Click Flights Tab
    [Documentation]    Clicking on flights tab in ixigo navigation bar
    Click Element    ${FLIGHTS_TAB}
    Sleep    2s
    Location Should Be    https://www.ixigo.com/flights

Click Hotels Tab
    [Documentation]    Clicking on hotels tab in ixigo navigation bar
    Click Element    ${HOTELS_TAB}
    Sleep    2s
    Location Should Be    https://www.ixigo.com/hotels

Click Trains Tab
    [Documentation]    Clicking on trains tab in ixigo navigation bar
    Click Element    ${TRAINS_TAB}
    Sleep    2s
    Location Should Be    https://www.ixigo.com/trains

Click Buses Tab
    [Documentation]    Clicking on buses tab in ixigo navigation bar
    Click Element    ${BUSES_TAB}
    Sleep    2s
    Location Should Be    https://www.ixigo.com/buses

