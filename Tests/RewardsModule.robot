*** Settings ***
Documentation       Rewards-module navigation test suite.

Resource            ../Resources/Pages/LoginPage.robot
Resource            ../Resources/Pages/RewardsPage.robot
Resource            ../Resources/Pages/CompanyPage.robot

Suite Setup         Run Keywords    Open Application    AND    Login To Application
Suite Teardown      Safe Close Application


*** Keywords ***

Safe Close Application
    ${status}=    Run Keyword And Return Status    Close Application
    Log    Browser close status: ${status}


*** Test Cases ***

Complete Reward Payment Then Follow A Company
    [Documentation]    Completes a reward payment, then follows and unfollows a company.
    [Tags]    regression    rewards    companies

    Reload Page
    Sleep    6s

    Open Rewards Module
    Sleep    6s

    Browse All Reward Categories
    Sleep    5s

    Open All Reward Categories
    Sleep    3s

    Search Reward Products    Car
    Sleep    5s

    Open Checkout From Search Result
    Sleep    5s

    Click Add New Delivery Address
    Sleep    3s

    Fill Delivery Address
    Sleep    3s

    Use This Delivery Address
    Sleep    3s

    Select Delivery Address Checkbox
    Sleep    3s

    Open Billing Address
    Sleep    3s

    Select Same As Delivery Address
    Sleep    3s

    Click Complete Secure Purchase
    Sleep    5s

    Verify Payment Options Are Open
    Sleep    3s

    Select Wallet Payment Option
    Sleep    3s

    Select Amazon Pay Wallet
    Sleep    3s

    Complete Mock Payment Successfully

    Switch Window    MAIN
    Reload Page
    Wait Until Page Contains Element    ${COMPANIES_TAB}    20s
    Open Companies Module
    Follow First Discover Company
    Open Followed Companies
    Unfollow First Followed Company
    Reload Page
    Wait Until Page Contains Element    ${MY_COMPANIES_TAB}    20s
    Open My Companies
