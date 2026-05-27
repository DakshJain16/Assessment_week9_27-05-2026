*** Variables ***
${FIRST_SUGGESTION}    xpath=(//div[contains(@class,'text-success-subtle')])[1]
${AVAILABLE_SEATS}    xpath=(//div[text()='Available'])[1]
# ${BOOK_BUTTON}    xpath=//div[@class="grid items-center gap-10 py-10 md:gap-20"]//button
${BOOK_BUTTON}    xpath=(//button[contains(.,'Book')])[1]
${ADD_PASSENGER_DIALOG}    xpath=//div[@role="dialog"]/div
${FULL_NAME_FIELD}    xpath=//label[text()="Full name as per Govt. ID"]/following-sibling::input
${AGE_FIELD}    xpath=//label[text()="Age"]/following-sibling::input
${GENDER}    xpath=//div[@class="flex w-full gap-15"]//p[text()="Male"]
${BERTH_PREFERENCE}    xpath=//input[@value="No Preference"]
${UPPER_BERTH_LOC}    xpath=//p[text()="Upper Berth"]
${SAVE_PASSENGER_BUTTON}    xpath=//button[text()="Save Passenger"]
${PROCEED_TO_PAY_BUTTON}    xpath=//button[text()="Proceed to Pay"]
${ADD_IRCTC_ID_DIALOG}    xpath=//h5[text()="Add IRCTC User ID"]