*** Settings ***
Resource    ../../resource/pages/ixigo_login.robot
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/pages/ixigo_flight_search.robot
Resource    ../../resource/pages/ixigo_flight_filter.robot
Resource    ../../resource/pages/ixigo_flight_booking.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
ETC_001 Book a flight
    [Documentation]    Test booking a flight from search results
    [Tags]    e2e

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
    Select Travellers And Class    adults=1    children=0    infants=0    travel_class=Economy

    # Click search button
    Click Search Button

    # Verify search results page is loaded
    Location Should Contain    flight
    Wait Until Page Contains Element    xpath=//div[@class="flex flex-col"]/div[2]/div/div

    # Apply filters
    Click Non-Stop Filter
    Click Price Filter
    Verify Flights Are Non Stop

    # Book a flight
    Sleep    30s
    Book A Flight
    Add Cancellation
    Add Details    John    Doe
    Add Contact Details    johndoe123@gmail.com
    Review Details
    Move To Payment Section

