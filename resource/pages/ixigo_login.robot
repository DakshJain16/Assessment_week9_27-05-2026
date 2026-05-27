*** Settings ***
Library    SeleniumLibrary
Resource   ../../locators/ixigo_login_locators.robot

*** Keywords ***
Close Image Popup
    [Documentation]    Close ixigo iframe popup if present
    ${popup_present}=    Run Keyword And Return Status
    ...    Wait Until Element Is Visible    xpath=//iframe[contains(@id,'wiz-iframe')]    5s

    IF    ${popup_present}
        Select Frame    xpath=//iframe[contains(@id,'wiz-iframe')]
        Wait Until Element Is Visible    id=closeButton    10s
        Execute JavaScript    document.getElementById('closeButton').click()
        Unselect Frame
    END

Click Login Button
    [Documentation]    Click the top-right Log in/Sign up button and wait for phone input to appear
    Close Image Popup
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Visible    ${PHONE_INPUT}    timeout=15s

Enter Phone Number
    [Documentation]    Enter the provided phone number into the phone field
    [Arguments]    ${phone}
    Input Text    ${PHONE_INPUT}    ${phone}
    Wait Until Element Is Enabled    ${CONTINUE_BUTTON}    timeout=10s
    Click Button    ${CONTINUE_BUTTON}

Enter OTP
    [Documentation]    Pause to allow manual OTP entry
    Sleep    40s
    # Wait Until Location Is    https://www.ixigo.com/?loginVisible=true

Verify Error Message
    [Documentation]    Verify the presence of the specified error message on the page
    Wait Until Element Is Visible    xpath=//div[contains(text(),"Please enter a valid phone number")]
