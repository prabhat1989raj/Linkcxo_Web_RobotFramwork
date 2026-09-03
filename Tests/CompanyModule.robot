*** Settings ***
Documentation       Companies-module test suite for discovery, follow, and unfollow actions.
Resource            ../Resources/Pages/LoginPage.robot
Resource            ../Resources/Pages/CompanyPage.robot

Suite Setup         Run Keywords    Open Application    AND    Login To Application    email=${SIGNUP_EMAIL}
Suite Teardown      Close Application

*** Test Cases ***
Follow And Unfollow A Company
    [Documentation]    Refreshes after login, follows a Discover company, then unfollows it from Followed and opens My Companies.
    [Tags]    regression    companies
    Reload Page
    Wait Until Page Contains Element    ${COMPANIES_TAB}    20s
    Open Companies Module
    Follow First Discover Company
    Open Followed Companies
    Unfollow First Followed Company
    Reload Page
    Wait Until Page Contains Element    ${MY_COMPANIES_TAB}    20s
    Open My Companies
