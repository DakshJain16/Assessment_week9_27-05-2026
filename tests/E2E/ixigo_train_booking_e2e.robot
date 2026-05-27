*** Settings ***
Resource    ../../resource/pages/ixigo_login.robot
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/pages/ixigo_train_search.robot
Resource    ../../resource/pages/ixigo_train_filter.robot
Resource    ../../resource/pages/ixigo_train_booking.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
ETC_002 Book a train ticket
    [Documentation]    Test the train ticket booking process on ixigo
    [Tags]    e2e

    Click Login Button
    Enter Phone Number    ${USER_PHONE}
    Enter OTP

    Click Trains Tab

    # Enter train search details
    Enter Departure Station    Jaipur
    Enter Arrival Station    Mumbai
    Select Departure Date    18    June    2026

    # Click search button
    Click Search Button
    Location Should Contain    train
    Wait Until Page Contains Element    xpath=//div[@id="srp"]    10s
    Sleep    5s

    # Apply filters
    Apply Filters - Best Available
    Apply Filters - AC Only

    # Book a train ticket from search results
    Click Book Button

    # Add passenger details in the booking form
    Add Passenger Details    John Doe    30

    # Proceed to payment after adding passenger details
    Proceed To Payment
