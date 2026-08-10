*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Survey

    Capture Page Screenshot

    ####################################
    ## Click Post
    ####################################

    Wait Until Element Is Visible    ${POST_BUTTON}    30s
    Wait Until Element Is Enabled    ${POST_BUTTON}    30s
    Click Element    ${POST_BUTTON}
    Sleep    2s

    ####################################
    ## Click Survey
    ####################################

    Wait Until Element Is Visible    ${SURVEY_OPTION}    30s
    Scroll Element Into View         ${SURVEY_OPTION}
    Sleep    2s
    Click Element                    ${SURVEY_OPTION}

    Wait Until Page Contains         Create a Survey    30s
    Sleep    5s

    Capture Page Screenshot

    ####################################
    ## Title
    ####################################

    Wait Until Element Is Visible    ${SURVEY_TITLE_INPUT}    30s
    Wait Until Element Is Enabled    ${SURVEY_TITLE_INPUT}    30s
    Scroll Element Into View         ${SURVEY_TITLE_INPUT}
    Sleep    2s

    Click Element                    ${SURVEY_TITLE_INPUT}
    Sleep    1s

    Clear Element Text               ${SURVEY_TITLE_INPUT}
    Input Text                       ${SURVEY_TITLE_INPUT}    ${SURVEY_TITLE}
    Sleep    2s

    ####################################
    ## Description
    ####################################

    Wait Until Element Is Visible    ${SURVEY_DESCRIPTION_INPUT}    30s
    Click Element                    ${SURVEY_DESCRIPTION_INPUT}
    Input Text
    ...    ${SURVEY_DESCRIPTION_INPUT}
    ...    ${SURVEY_DESCRIPTION}
    Sleep    2s

    ####################################
    ## Category
    ####################################

    Click Element    ${CATEGORY_DROPDOWN}
    Sleep    3s
    Click Element    ${CATEGORY_OPTION}
    Sleep    2s

    ####################################
    ## Question 1
    ####################################

    Input Text
    ...    ${QUESTION1_INPUT}
    ...    ${SURVEY_QUESTION_1}

    ####################################
    ## Question Type
    ####################################

    Click Element    ${QUESTION_TYPE1_DROPDOWN}
    Sleep    2s
    Click Element    ${MULTIPLE_CHOICE_OPTION}
    Sleep    2s

    ####################################
    ## Question 1 Options
    ####################################

    Clear Element Text    ${OPTION1_INPUT}
    Input Text            ${OPTION1_INPUT}    ${SURVEY_OPTION_1}
    Sleep    2s

    Clear Element Text    ${OPTION2_INPUT}
    Input Text            ${OPTION2_INPUT}    ${SURVEY_OPTION_2}
    Sleep    2s

    Click Element         ${ADD_OPTION_BUTTON}
    Sleep    2s

    Clear Element Text    ${OPTION3_INPUT}
    Input Text            ${OPTION3_INPUT}    ${SURVEY_OPTION_3}
    Sleep    2s

    ####################################
    ## Question 2
    ####################################

    Input Text
    ...    ${QUESTION2_INPUT}
    ...    ${SURVEY_QUESTION_2}

    Sleep    2s

    ####################################
    ## Question 2 Type
    ####################################

    Scroll Element Into View         ${QUESTION_TYPE2_DROPDOWN}
    Wait Until Element Is Visible    ${QUESTION_TYPE2_DROPDOWN}    20s
    Click Element                    ${QUESTION_TYPE2_DROPDOWN}

    Wait Until Element Is Visible    ${SELECT_OPTION_TYPE}    20s
    Click Element                    ${SELECT_OPTION_TYPE}

    ####################################
    ## Question 2 Options
    ####################################

    Clear Element Text    ${QUESTION2_OPTION1_INPUT}
    Input Text            ${QUESTION2_OPTION1_INPUT}    ${SURVEY_Q2_OPTION_1}
    Sleep    2s

    Clear Element Text    ${QUESTION2_OPTION2_INPUT}
    Input Text            ${QUESTION2_OPTION2_INPUT}    ${SURVEY_Q2_OPTION_2}
    Sleep    2s

    ####################################
    ## Survey Duration
    ####################################

    Scroll Element Into View         ${SURVEY_DURATION_DROPDOWN}
    Wait Until Element Is Visible    ${SURVEY_DURATION_DROPDOWN}    20s
    Click Element                    ${SURVEY_DURATION_DROPDOWN}

    Wait Until Element Is Visible    ${ONE_WEEK_OPTION}    20s
    Click Element                    ${ONE_WEEK_OPTION}

    ####################################
    ## Create Survey
    ####################################

    Scroll Element Into View         ${CREATE_SURVEY_BUTTON}
    Wait Until Element Is Enabled    ${CREATE_SURVEY_BUTTON}    20s
    Sleep    2s
    Click Element                    ${CREATE_SURVEY_BUTTON}

    Sleep    10s

    Capture Page Screenshot