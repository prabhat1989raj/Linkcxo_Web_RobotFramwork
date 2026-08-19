*** Settings ***
Documentation    Keywords for browsing and following companies.
Library          SeleniumLibrary
Resource         ../Variables/Config.robot

*** Variables ***
${COMPANIES_TAB}            xpath=//*[self::div or self::a or self::button][normalize-space()='Companies']
${DISCOVER_TAB}             xpath=//*[self::div or self::a or self::button][normalize-space()='Discover']
${FOLLOWED_TAB}             xpath=//*[self::div or self::a or self::button][normalize-space()='Followed']
${MY_COMPANIES_TAB}         xpath=//*[self::div or self::a or self::button][normalize-space()='My Companies']
${COMPANY_CARD}             xpath=//button[normalize-space()='Follow' or normalize-space()='Unfollow']/ancestor::div[.//button[normalize-space()='Follow' or normalize-space()='Unfollow']][1]
${FOLLOW_BUTTON}            xpath=(//button[normalize-space()='Follow'])[1]
${UNFOLLOW_BUTTON}          xpath=(//button[normalize-space()='Unfollow'])[1]

*** Keywords ***
Open Companies Module
    Wait Until Element Is Visible    ${COMPANIES_TAB}    ${TIMEOUT}
    Scroll Element Into View         ${COMPANIES_TAB}
    Click Element                    ${COMPANIES_TAB}
    Wait Until Element Is Visible    ${DISCOVER_TAB}    ${TIMEOUT}
    Click Element                    ${DISCOVER_TAB}
    Wait Until Element Is Visible    ${FOLLOW_BUTTON}    ${TIMEOUT}

Follow First Discover Company
    Wait Until Element Is Visible    ${FOLLOW_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${FOLLOW_BUTTON}
    Click Element                    ${FOLLOW_BUTTON}
    Wait Until Element Is Visible    ${UNFOLLOW_BUTTON}    ${TIMEOUT}

Open Followed Companies
    Wait Until Element Is Visible    ${FOLLOWED_TAB}    ${TIMEOUT}
    Click Element                    ${FOLLOWED_TAB}
    Wait Until Element Is Visible    ${COMPANY_CARD}    ${TIMEOUT}

Unfollow First Followed Company
    Wait Until Element Is Visible    ${UNFOLLOW_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${UNFOLLOW_BUTTON}
    Click Element                    ${UNFOLLOW_BUTTON}

Open My Companies
    Wait Until Element Is Visible    ${MY_COMPANIES_TAB}    ${TIMEOUT}
    Click Element                    ${MY_COMPANIES_TAB}
