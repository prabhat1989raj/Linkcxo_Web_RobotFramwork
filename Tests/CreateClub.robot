*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/ClubPage.robot

Suite Setup       Open Application
Suite Teardown    Close Application


*** Variables ***
${DELAY}    1s


*** Test Cases ***
Create Public And Private Club Successfully
    Set Selenium Speed    ${DELAY}

    Login To Application
    Create New Club

    Sleep    10s

    Scroll Element Into View          ${HAMBURGER_MENU}
    Click Element                     ${HAMBURGER_MENU}
    Wait Until Element Is Visible     ${CLUB_MENU}    ${TIMEOUT}
    Click Element                     ${CLUB_MENU}

    Create New Club    ${CLUB_TYPE_PRIVATE}