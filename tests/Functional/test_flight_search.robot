*** Settings ***
Resource   ../../resource/pages/ixigo_login.robot
Resource   ../../resource/pages/ixigo_navigation.robot
Resource   ../../resource/pages/ixigo_flight_search.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_004 Search one-way domestic flight
    [Documentation]    Test one-way flight search
    [Tags]    functional

    Click Login Button
    Enter Phone Number    ${USER_PHONE}
    Enter OTP

    Click Flights Tab

    # Enter flight search details
    Click One Way Button
    Enter From City    Delhi
    Enter To City    Mumbai
    Select Departure Date For One Way    2    July    2026

    # Select traveller and class details
    Select Travellers And Class    adults=2    children=1    infants=1    travel_class=Economy

    # Click search button
    Click Search Button

    # Verify search results page is loaded
    Location Should Contain    flight
    Wait Until Page Contains Element    xpath=//div[@class="flex flex-col"]/div[2]/div/div
    # Page Should Contain Element    xpath=(//div[@class="flex flex-col"])[8]

FTC_005 Search round-trip international flight
    [Documentation]    Test round-trip flight search
    [Tags]    functional

    Click Login Button
    Enter Phone Number    ${USER_PHONE}
    Enter OTP

    Click Flights Tab

    # Enter flight search details
    Click Round Trip Button
    Enter From City    Delhi
    Enter To City    Paris
    Select Departure Date For Round Trip    15    August    2026
    Select Return Date    30    August    2026

    # Select traveller and class details
    Select Travellers And Class    adults=2    children=0    infants=0    travel_class=Business

    # Click search button
    Click Search Button

    # Verify search results page is loaded
    Location Should Contain    flight
    Wait Until Page Contains Element    xpath=//div[@class="mb-20"]/following-sibling::div[2]/div/div
    Log To Console    success
    # Sleep    10s

