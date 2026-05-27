*** Settings ***
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/pages/ixigo_login.robot
Resource    ../../resource/pages/ixigo_train_search.robot
Resource    ../../resource/pages/ixigo_train_filter.robot
Resource    ../../resource/common_resources.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_009 Apply filters on train search results
    [Documentation]    Test applying filters on the train search results page
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
    Location Should Contain    train
    Wait Until Page Contains Element    xpath=//div[@id="srp"]    10s
    Sleep    5s

    # Apply filters on search results
    Apply Filters - Best Available
    Apply Filters - AC Only

    # Verify filters are applied (this can be enhanced with specific checks for filtered results)
    Wait Until Page Contains Element    xpath=//div[@id="srp"]    10s
    Sleep    10s
    Log To Console    Filters applied successfully