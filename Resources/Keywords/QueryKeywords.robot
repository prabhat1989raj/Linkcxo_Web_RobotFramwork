*** Settings ***
Library    SeleniumLibrary

*** Variables ***

# Home Page
${POST_BUTTON}            xpath=//button[normalize-space()='Post']

# Create Query Option
${CREATE_QUERY}           xpath=//h1[normalize-space()='Post as a query']

# Create Query Popup
${QUERY_POPUP}            xpath=//h2[contains(normalize-space(),'Create a Query')]

# Category Dropdown (may need adjustment)
${CATEGORY_DROPDOWN}      xpath=//label[contains(normalize-space(),'Category')]/following::div[contains(@class,'control')][1]

# Category Option
${CATEGORY_OPTION}        xpath=//div[@role='option'][normalize-space()='Technology and IT']

# Question
${QUERY_QUESTION}         xpath=//input[@placeholder='Enter Questions']

# Description
${QUERY_DESCRIPTION}      xpath=//textarea[@placeholder='Add a brief description']

# Save Button
${SAVE_QUERY}             xpath=//button[normalize-space()='Save Query']


*** Keywords ***

Create New Query

    Capture Page Screenshot

    #####################################################
    # Click Post
    #####################################################

    Wait Until Element Is Visible    ${POST_BUTTON}    30s
    Scroll Element Into View         ${POST_BUTTON}
    Click Element                    ${POST_BUTTON}

    Sleep    2s

    #####################################################
    # Click Post as a Query
    #####################################################

    Wait Until Element Is Visible    ${CREATE_QUERY}    30s
    Scroll Element Into View         ${CREATE_QUERY}
    Click Element                    ${CREATE_QUERY}

    #####################################################
    # Wait For Query Popup
    #####################################################

    Wait Until Page Contains         Create a Query    timeout=30s

    Capture Page Screenshot

    #####################################################
    # Select Category
    #####################################################

    Wait Until Element Is Visible    ${CATEGORY_DROPDOWN}    30s
    Click Element                    ${CATEGORY_DROPDOWN}

    Sleep    2s

    Wait Until Element Is Visible    ${CATEGORY_OPTION}    30s
    Click Element                    ${CATEGORY_OPTION}

    #####################################################
    # Question
    #####################################################

    Wait Until Element Is Visible    ${QUERY_QUESTION}    30s
    Click Element                    ${QUERY_QUESTION}
    Input Text                       ${QUERY_QUESTION}    What is your Name?

    #####################################################
    # Description
    #####################################################

    Wait Until Element Is Visible    ${QUERY_DESCRIPTION}    30s
    Click Element                    ${QUERY_DESCRIPTION}
    Input Text                       ${QUERY_DESCRIPTION}    This is a test query created using Robot Framework.

    #####################################################
    # Save Query
    #####################################################

    Wait Until Element Is Visible    ${SAVE_QUERY}    30s
    Scroll Element Into View         ${SAVE_QUERY}
    Click Element                    ${SAVE_QUERY}

    Sleep    5s

    Capture Page Screenshot