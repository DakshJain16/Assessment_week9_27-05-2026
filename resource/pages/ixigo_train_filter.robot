*** Settings ***
Library    SeleniumLibrary
Resource    ../../locators/ixigo_train_filter_locators.robot

*** Keywords ***
Apply Filters - Best Available
    [Documentation]    Apply the "Best Available" filter on the train search results page
    Wait Until Element Is Visible    ${BEST_AVAILABLE}    10s
    Click Element    ${BEST_AVAILABLE}
    Sleep    2s

Apply Filters - AC Only
    [Documentation]    Apply the "AC Only" filter on the train search results page
    Wait Until Element Is Visible    ${AC_ONLY}    10s
    Click Element    ${AC_ONLY}
    Sleep    2s
