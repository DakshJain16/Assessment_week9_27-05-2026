*** Settings ***
Resource    ../../resource/pages/ixigo_navigation.robot
Resource    ../../resource/common_resources.robot
Resource    ../../resource/pages/ixigo_login.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_003 Verify Navigation
    [Documentation]    Verify navigation to different sections of the application
    [Tags]    functional

    Click Login Button
    Enter Phone Number    ${USER_PHONE}
    Enter OTP

    Verify Tabs Are Visible
    Click Flights Tab
    Click Hotels Tab
    Click Trains Tab
    Click Buses Tab
    Click Ixigo Logo
