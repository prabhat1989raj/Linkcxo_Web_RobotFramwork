*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Keywords/PostKeywords.robot
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser


*** Variables ***
${URL}        https://cxostory.in/
${BROWSER}    Chrome
${DELAY}      2s


*** Test Cases ***
Create Post After Login
    Login To Application
    Create New Post


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}