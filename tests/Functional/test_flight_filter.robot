*** Settings ***
Resource    ../../resource/pages/ixigo_login.robot
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/pages/ixigo_flight_search.robot
Resource    ../../resource/pages/ixigo_flight_filter.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_006 Apply filters
    [Documentation]    Test applying filters on flight search results
    [Tags]    functional

    # Click Login Button
    # Enter Phone Number    ${USER_PHONE}
    # Enter OTP

    Click Flights Tab

    # Enter flight search details
    Click One Way Button
    Enter From City    Delhi
    Enter To City    Mumbai
    Select Departure Date For One Way    2    July    2026

    # Select traveller and class details
    Select Travellers And Class    adults=1    children=0    infants=0    travel_class=Economy

    # Click search button
    Click Search Button

    # Verify search results page is loaded
    Location Should Contain    flight
    Wait Until Page Contains Element    xpath=//div[@class="flex flex-col"]/div[2]/div/div

    # Apply filters
    Click Non-Stop Filter
    Click Price Filter

    # Verify filters are applied
    Verify Flights Are Non Stop
