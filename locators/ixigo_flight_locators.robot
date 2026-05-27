*** Variables ***
${ONE_WAY_BUTTON}    xpath=//button[text()='One Way']
${ROUND_TRIP_BUTTON}    xpath=//button[text()='Round Trip']
${FROM_FIELD}    xpath=//span[contains(text(), 'From')]
${FROM_INPUT}    xpath=//label[contains(text(), 'From')]/following-sibling::input
${TO_FIELD}    xpath=//span[contains(text(), 'To')]
${TO_INPUT}    xpath=//label[contains(text(), 'To')]/following-sibling::input
# ${DEPARTURE_DATE_INPUT}    xpath=(//div[@class="flex items-center "])[3]
${DEPARTURE_DATE_INPUT}    xpath=//p[text()='Departure']/following-sibling::p
${RETURN_DATE_INPUT}    xpath=//p[text()='Return']/following-sibling::p
${NEXT_BUTTON}    xpath=//button[@class="react-calendar__navigation__arrow react-calendar__navigation__next-button"]
${TRAVELLER_CLASS_BUTTON}    xpath=//div[@class="flex items-center !border-none"]
${DONE_BUTTON}    xpath=//button[contains(text(), 'Done')]
${SEARCH_BUTTON}    xpath=//button[contains(text(), 'Search')]

