*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${POST_BUTTON}          xpath=//button[normalize-space()='Post']
${CREATE_POLL}          xpath=//h1[normalize-space()='Create a poll']
${POLL_QUESTION}        xpath=//textarea[@id='question']

${CATEGORY_DROP}        xpath=//label[contains(text(),'Categ')]/following::div[1]
${CATEGORY_SELECT}      xpath=//div[normalize-space()='Business Growth']

${OPTION_ONE}           xpath=//input[@placeholder='Option 1']
${OPTION_TWO}           xpath=//input[@placeholder='Option 2']

${SAVE_BUTTON}          xpath=//button[normalize-space()='Save']


*** Keywords ***

Create New Poll

    Capture Page Screenshot

    # Click Post Button
    Wait Until Element Is Visible    ${POST_BUTTON}    30s
    Click Element    ${POST_BUTTON}

    # Click Create Poll
    Wait Until Element Is Visible    ${CREATE_POLL}    30s
    Scroll Element Into View         ${CREATE_POLL}
    Click Element                    ${CREATE_POLL}
    Sleep    2s

    Capture Page Screenshot

    # Enter Poll Question
    Wait Until Element Is Visible    ${POLL_QUESTION}    30s
    Clear Element Text               ${POLL_QUESTION}
    Input Text                       ${POLL_QUESTION}    What is your favorite color?

    # Select Category
    Wait Until Element Is Visible    ${CATEGORY_DROP}    20s
    Click Element                    ${CATEGORY_DROP}
    Sleep    1s

    Wait Until Element Is Visible    ${CATEGORY_SELECT}    20s
    Click Element                    ${CATEGORY_SELECT}

    # Enter Options
    Wait Until Element Is Visible    ${OPTION_ONE}    20s
    Input Text                       ${OPTION_ONE}    Red

    Wait Until Element Is Visible    ${OPTION_TWO}    20s
    Input Text                       ${OPTION_TWO}    Black

    Capture Page Screenshot

    # Save Poll
    Wait Until Element Is Visible    ${SAVE_BUTTON}    30s
    Scroll Element Into View         ${SAVE_BUTTON}
    Click Element                    ${SAVE_BUTTON}

    Sleep    3s

    Capture Page Screenshot