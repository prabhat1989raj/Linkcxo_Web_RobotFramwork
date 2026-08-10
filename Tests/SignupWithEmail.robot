*** Settings ***
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Keywords/SignupEmailKeywords.robot

Suite Setup       Open Application
Suite Teardown    Close Application


*** Test Cases ***
Signup Using Email Successfully
    Signup Using Email