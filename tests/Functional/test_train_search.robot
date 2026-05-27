*** Settings ***
Resource    ../../resource/pages/ixigo_login.robot
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/pages/ixigo_train_search.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_008 Search for trains
    [Documentation]    Test searching for trains between two cities
    [Tags]    functional

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

    # Verify search results page is loaded
    Location Should Contain    train
    Wait Until Page Contains Element    xpath=//div[@id="srp"]    20s
    Sleep    10s
    Log To Console    success