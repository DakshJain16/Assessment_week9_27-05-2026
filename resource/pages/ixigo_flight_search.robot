*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/ixigo_flight_locators.robot

*** Keywords ***
Click One Way Button
    [Documentation]    Click the One Way button to select one-way flight search
    Wait Until Element Is Visible    ${ONE_WAY_BUTTON}    10s
    Click Element    ${ONE_WAY_BUTTON}
    Sleep    1s

Click Round Trip Button
    [Documentation]    Click the Round Trip button to select round-trip flight search
    Wait Until Element Is Visible    ${ROUND_TRIP_BUTTON}    10s
    Click Element    ${ROUND_TRIP_BUTTON}
    Sleep    1s

Enter From City
    [Documentation]    Enter the departure city in the From field
    [Arguments]    ${city}
    Wait Until Element Is Visible    ${FROM_FIELD}    10s
    Click Element    ${FROM_FIELD}
    Clear Element Text    ${FROM_INPUT}
    Input Text    ${FROM_INPUT}    ${city}
    Sleep    1s
    Click Element    xpath=(//div[contains(@class, 'overflow-y-scroll')])[1]/div[1]/div[1]
    Sleep    2s

Enter To City
    [Documentation]    Enter the destination city in the To field
    [Arguments]    ${city}
    # Wait Until Element Is Visible    ${TO_FIELD}    10s
    # Click Element    ${TO_FIELD}
    Clear Element Text    ${TO_INPUT}
    Input Text    ${TO_INPUT}    ${city}
    Sleep    1s
    Click Element    xpath=(//div[contains(@class, 'overflow-y-scroll')])[2]/div[1]/div[1]
    Sleep    2s

Select Departure Date For One Way
    [Documentation]    Select the departure date from the dynamic calendar
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    ${DEPARTURE_DATE_INPUT}
    
    ${target_month_year}=    Set Variable    ${month} ${year}
    ${month_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    
    ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]

    WHILE    not ${month_visible}
        Click Element    ${NEXT_BUTTON}
        Sleep    1s
        ${month_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]
    END

    ${date_locator}=    Set Variable    
    ...    xpath=//button[@class="react-calendar__tile react-calendar__month-view__days__day"]/abbr[@aria-label="${day} ${month} ${year}"]

    Wait Until Element Is Visible    ${date_locator}    10s
    Click Element    ${date_locator}
    Sleep    1s

Select Departure Date For Round Trip
    [Documentation]    Select the departure date from the dynamic calendar
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    ${DEPARTURE_DATE_INPUT}

    ${target_month_year}=    Set Variable    ${month} ${year}
    ${month_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]

    WHILE    not ${month_visible}
        Click Element    ${NEXT_BUTTON}
        Sleep    1s
        ${month_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]
    END

    ${date_locator}=    Set Variable
    ...    xpath=//button[@class="react-calendar__tile react-calendar__month-view__days__day react-calendar__month-view__days__day--weekend"]/abbr[@aria-label="${day} ${month} ${year}"]

    Wait Until Element Is Visible    ${date_locator}    10s
    Click Element    ${date_locator}
    Sleep    1s

Select Return Date
    [Documentation]    Select the departure date from the dynamic calendar
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    ${RETURN_DATE_INPUT}
    
    ${target_month_year}=    Set Variable    ${month} ${year}
    ${month_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible    
    ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]

    WHILE    not ${month_visible}
        Click Element    ${NEXT_BUTTON}
        Sleep    1s
        ${month_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(), "${target_month_year}")]
    END

    ${date_locator}=    Set Variable
    ...    xpath=//button[@class="react-calendar__tile react-calendar__month-view__days__day react-calendar__month-view__days__day--weekend"]/abbr[@aria-label="${day} ${month} ${year}"]

    Wait Until Element Is Visible    ${date_locator}    10s
    Click Element    ${date_locator}
    Sleep    1s

Select Travellers And Class
    [Documentation]    Generic keyword to select adults, children, infants and class
    [Arguments]    ${adults}=1    ${children}=0    ${infants}=0    ${travel_class}=Economy

    Wait Until Element Is Visible    ${TRAVELLER_CLASS_BUTTON}    10s
    Click Element    ${TRAVELLER_CLASS_BUTTON}

    Sleep    2s

    # Select Adults
    Click Element
    ...    xpath=(//div[contains(@class,'justify-start')])[2]//button[@data-testid='${adults}']
    Sleep    1s

    # Select Children
    Click Element
    ...    xpath=(//div[contains(@class,'justify-start')])[4]//button[@data-testid='${children}']
    Sleep    1s

    # Select Infants
    Click Element
    ...    xpath=(//div[contains(@class,'justify-start')])[6]//button[@data-testid='${infants}']
    Sleep    1s

    # Select Travel Class
    Click Element
    ...    xpath=//span[text()='${travel_class}']/parent::div
    Sleep    1s

    Click Element    ${DONE_BUTTON}

Click Search Button
    [Documentation]    Click the Search button to initiate the flight search
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    10s
    Click Element    ${SEARCH_BUTTON}
    Sleep    5s

