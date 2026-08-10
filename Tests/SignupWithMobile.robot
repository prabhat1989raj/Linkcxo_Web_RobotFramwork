*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Keywords/SignupMobileKeywords.robot

Suite Setup       Open Browser    https://cxostory.in/    Chrome
Suite Teardown    Close Browser


*** Test Cases ***

Signup With Mobile
    Signup Using Mobile