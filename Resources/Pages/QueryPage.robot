*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Query
    [Documentation]    Creates a query by selecting a category, entering a question,
    ...                and a description, then saves it

    Wait Until Element Is Visible    ${POST_BUTTON}    ${TIMEOUT}
    Wait Until Element Is Enabled    ${POST_BUTTON}    ${TIMEOUT}
    Click Element                    ${POST_BUTTON}

    Wait Until Element Is Visible    ${CREATE_QUERY_OPTION}    ${TIMEOUT}
    Click Element                    ${CREATE_QUERY_OPTION}

    Wait Until Element Is Visible    ${QUERY_CATEGORY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${QUERY_CATEGORY_DROPDOWN}
    Wait Until Element Is Visible    ${QUERY_CATEGORY_OPTION}    ${TIMEOUT}
    Click Element                    ${QUERY_CATEGORY_OPTION}

    Wait Until Element Is Visible    ${QUERY_QUESTIONS}    ${TIMEOUT}
    Input Text                       ${QUERY_QUESTIONS}    ${QUERY_QUESTION_TEXT}

    Wait Until Element Is Visible    ${QUERY_DESCRIPTION}    ${TIMEOUT}
    Input Text                       ${QUERY_DESCRIPTION}    ${QUERY_DESCRIPTION_TEXT}

    Wait Until Element Is Enabled    ${QUERY_SAVE_BUTTON}    ${TIMEOUT}
    Click Element                    ${QUERY_SAVE_BUTTON}

    Wait Until Element Is Visible    ${QUERY_SUCCESS_MESSAGE}    ${TIMEOUT}