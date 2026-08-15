*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Keywords/SignupMobileKeywords.robot

Suite Setup       Run Keywords    Open Browser    https://cxostory.in/    Chrome    AND    Set Selenium Speed    2s
Suite Teardown    Close Browser


*** Test Cases ***

Signup With Mobile
    Signup Using Mobile
