*** Settings ***
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Common/Browser.robot

Suite Setup       Open Application
Suite Teardown    Close Application

*** Test Cases ***
Verify Login To LinkCXO
    Login To Application