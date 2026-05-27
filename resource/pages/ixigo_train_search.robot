*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource   ../../locators/ixigo_train_locators.robot

*** Keywords ***
Enter Departure Station
    [Documentation]    Enter the departure station in the Departure field
    [Arguments]    ${station}
    Wait Until Element Is Visible    ${DEPARTURE_CITY}    10s
    Click Element    ${DEPARTURE_CITY}
    Clear Element Text    ${DEPARTURE_CITY}
    Input Text    ${DEPARTURE_CITY}    ${station}
#    Press Keys    ${DEPARTURE_CITY}    ARROW_DOWN
#    Press Keys    ${DEPARTURE_CITY}    ENTER
#    Sleep    3s
    Sleep    1s
    Click Element    xpath=//div[contains(@class, 'overflow-auto')]/div[1]
    Sleep    2s
    
Enter Arrival Station
    [Documentation]    Enter the arrival station in the Arrival field
    [Arguments]    ${station}
    # Wait Until Element Is Visible    ${ARRIVAL_CITY}    10s
    # Click Element    ${ARRIVAL_CITY}
    Clear Element Text    ${ARRIVAL_CITY}
    Input Text    ${ARRIVAL_CITY}    ${station}
#    Press Keys    ${ARRIVAL_CITY}    ARROW_DOWN
#    Press Keys    ${ARRIVAL_CITY}    ENTER
#    Sleep    3s
    Sleep    1s
    Click Element    xpath=//div[contains(@class, 'overflow-auto')]/div[1]
    Sleep    2s

Select Departure Date
    [Documentation]    Select the departure date from the dynamic calendar
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    ${DEPARTURE_DATE_INPUT}

    ${target_month_year}=    Set Variable    ${month} ${year}
    ${month_visible}=    Run Keyword And Return Status
    ...    Element Should Be Visible
    ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(),'${target_month_year}')]

    WHILE    not ${month_visible}
        Click Element    ${NEXT_BUTTON}
        Sleep    1s
        ${month_visible}=    Run Keyword And Return Status
        ...    Element Should Be Visible
        ...    xpath=//button[@class="react-calendar__navigation__label"]/span[contains(text(),'${target_month_year}')]
    END

    ${date_locator}=    Set Variable
    ...    xpath=//button[@class="react-calendar__tile react-calendar__month-view__days__day"]/abbr[@aria-label="${day} ${month} ${year}"]

    Wait Until Element Is Visible    ${date_locator}    10s
    Click Element    ${date_locator}
    Sleep    1s

Click Search Button
    [Documentation]    Click the search button to find trains
    Wait Until Element Is Visible    ${SEARCH_BUTTON}    10s
    Click Element    ${SEARCH_BUTTON}
    Sleep    2s