*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/PollPage.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser


*** Variables ***
${URL}        https://cxostory.in/
${BROWSER}    Chrome
${DELAY}      1s


*** Test Cases ***
Create Poll After Login
    Login To Application
    Create New Poll


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}