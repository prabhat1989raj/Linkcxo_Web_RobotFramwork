*** Settings ***
Documentation    Business flow for bookmarking and applying to a recommended job.
Library          SeleniumLibrary
Resource         ../Variables/Config.robot

*** Variables ***
${JOBS_TAB}                 xpath=//div[contains(@class,'text-xs') and normalize-space()='Jobs']
${RECOMMENDED_TAB}          xpath=//*[self::div or self::span or self::p or self::a or self::button][normalize-space()='Recommended']
${ALL_JOBS_TAB}             xpath=//*[self::div or self::span or self::p or self::a or self::button][normalize-space()='All Jobs']
${MY_JOBS_TAB}              xpath=//*[self::div or self::span or self::p or self::a or self::button][normalize-space()='My Jobs']
${LINKEDIN_JOB_POST_TAB}    xpath=//*[self::div or self::span or self::p or self::a or self::button][normalize-space()='LinkedIn Job Post']
${JOB_DETAILS_PANEL}        xpath=//button[normalize-space()='Save' or normalize-space()='Saved']/ancestor::*[self::div or self::section][1]
${BOOKMARK_BUTTON}          xpath=//button[normalize-space()='Save']
${EXTERNAL_APPLY_BUTTON}    xpath=//button[contains(normalize-space(),'External Apply')]
${VIEW_POST_BUTTON}         xpath=(//button[contains(translate(normalize-space(), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'), 'view post')])[last()]
${FIRST_LINKEDIN_JOB_CARD}  xpath=(//div[@role='button' and @tabindex='0'])[1]

*** Keywords ***
Open Recommended Jobs
    Wait Until Element Is Visible    ${JOBS_TAB}    ${TIMEOUT}
    Click Element                    ${JOBS_TAB}
    Wait Until Element Is Visible    ${RECOMMENDED_TAB}    ${TIMEOUT}
    Click Element                    ${RECOMMENDED_TAB}
    Wait Until Element Is Visible    ${BOOKMARK_BUTTON}    ${TIMEOUT}

Bookmark Recommended Job
    Wait Until Element Is Visible    ${BOOKMARK_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${BOOKMARK_BUTTON}
    Click Element                    ${BOOKMARK_BUTTON}

Open External Job Application
    @{open_windows}=    Get Window Handles
    ${jobs_window}=    Set Variable    ${open_windows}[0]
    ${window_count}=    Get Length    ${open_windows}
    Wait Until Element Is Visible    ${EXTERNAL_APPLY_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${EXTERNAL_APPLY_BUTTON}
    Click Element                    ${EXTERNAL_APPLY_BUTTON}
    Wait Until Keyword Succeeds    ${TIMEOUT}    1s    New Browser Tab Should Be Open    ${window_count}
    Switch Window    NEW
    RETURN    ${jobs_window}

Open LinkedIn Job Post
    @{open_windows}=    Get Window Handles
    ${jobs_window}=    Set Variable    ${open_windows}[0]
    ${window_count}=    Get Length    ${open_windows}
    Wait Until Element Is Visible    ${VIEW_POST_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${VIEW_POST_BUTTON}
    Click Element                    ${VIEW_POST_BUTTON}
    Wait Until Keyword Succeeds    ${TIMEOUT}    1s    New Browser Tab Should Be Open    ${window_count}
    Switch Window    NEW
    RETURN    ${jobs_window}

New Browser Tab Should Be Open
    [Arguments]    ${previous_window_count}
    @{open_windows}=    Get Window Handles
    ${window_count}=    Get Length    ${open_windows}
    Should Be True    ${window_count} > ${previous_window_count}

Return To Jobs Tab
    [Arguments]    ${jobs_window}
    Close Window
    Switch Window    ${jobs_window}

Open All Jobs My Jobs And LinkedIn Job Post
    Wait Until Element Is Visible    ${ALL_JOBS_TAB}    ${TIMEOUT}
    Click Element                    ${ALL_JOBS_TAB}
    Wait Until Element Is Visible    ${MY_JOBS_TAB}    ${TIMEOUT}
    Click Element                    ${MY_JOBS_TAB}
    Wait Until Element Is Visible    ${LINKEDIN_JOB_POST_TAB}    ${TIMEOUT}
    Click Element                    ${LINKEDIN_JOB_POST_TAB}
    Click First LinkedIn Job Card

Open LinkedIn Job Post Section
    Wait Until Element Is Visible    ${JOBS_TAB}    ${TIMEOUT}
    Click Element                    ${JOBS_TAB}
    Wait Until Element Is Visible    ${LINKEDIN_JOB_POST_TAB}    ${TIMEOUT}
    Click Element                    ${LINKEDIN_JOB_POST_TAB}
    Click First LinkedIn Job Card
    Wait Until Element Is Visible    ${BOOKMARK_BUTTON}    ${TIMEOUT}

Click First LinkedIn Job Card
    Wait Until Element Is Visible    ${FIRST_LINKEDIN_JOB_CARD}    ${TIMEOUT}
    Scroll Element Into View         ${FIRST_LINKEDIN_JOB_CARD}
    Click Element                    ${FIRST_LINKEDIN_JOB_CARD}
    Wait Until Element Is Visible    ${BOOKMARK_BUTTON}    ${TIMEOUT}
