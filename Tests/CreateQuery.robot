*** Settings ***
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/QueryPage.robot

Suite Setup       Run Keywords    Open Application    AND    Login To Application
Suite Teardown    Close Application

*** Test Cases ***
Create Query Successfully
    Create New Query