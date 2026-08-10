*** Settings ***
Resource    ../Resources/Common/Browser.robot
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/SurveyPage.robot

Suite Setup       Open Application
Suite Teardown    Close Application

*** Test Cases ***
Create Survey Successfully
    Login To Application
    Create New Survey