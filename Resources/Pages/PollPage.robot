*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Poll
    [Documentation]    Creates a poll with a category and 2 options, then saves it

    Wait Until Element Is Visible    ${POST_BUTTON}    ${TIMEOUT}
    Wait Until Element Is Enabled    ${POST_BUTTON}    ${TIMEOUT}
    Click Element                    ${POST_BUTTON}

    Wait Until Element Is Visible    ${CREATE_POLL_OPTION}    ${TIMEOUT}
    Click Element                    ${CREATE_POLL_OPTION}

    Wait Until Element Is Visible    ${POLL_QUESTION}    ${TIMEOUT}
    Input Text                       ${POLL_QUESTION}    ${POLL_QUESTION_TEXT}

    Wait Until Element Is Visible    ${CATEGORY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${CATEGORY_DROPDOWN}
    Wait Until Element Is Visible    ${FIRST_CATEGORY_OPTION}    ${TIMEOUT}
    Click Element                    ${FIRST_CATEGORY_OPTION}

    Wait Until Element Is Visible    ${OPTION_1}    ${TIMEOUT}
    Input Text                       ${OPTION_1}    ${POLL_OPTION_1}

    Wait Until Element Is Visible    ${OPTION_2}    ${TIMEOUT}
    Input Text                       ${OPTION_2}    ${POLL_OPTION_2}

    Wait Until Element Is Enabled    ${SAVE_POLL_BUTTON}    ${TIMEOUT}
    Click Element                    ${SAVE_POLL_BUTTON}

    Wait Until Element Is Visible    ${POLL_SUCCESS_MESSAGE}    ${TIMEOUT}