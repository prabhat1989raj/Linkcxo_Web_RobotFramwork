*** Settings ***
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/ArticlePage.robot

Suite Setup       Run Keywords    Open Application    AND    Login To Application
Suite Teardown    Close Application

*** Test Cases ***
Create Article Successfully
    Create New Article