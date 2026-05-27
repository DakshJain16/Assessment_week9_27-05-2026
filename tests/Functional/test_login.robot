*** Settings ***
Resource    ../../resource/common_resources.robot
Resource    ../../resource/pages/ixigo_login.robot

Suite Setup    Load Environment
Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
FTC_001 Login with valid phone number
    [Documentation]    Login with valid phone number and verify OTP entry
    [Tags]    functional
    Click Login Button
    Enter Phone Number    ${USER_PHONE}
    Enter OTP

FTC_002 Login with invalid phone number
    [Documentation]    Login with invalid phone number and verify error message
    [Tags]    functional  negative
    Click Login Button
    Enter Phone Number    12345
    Verify Error Message
