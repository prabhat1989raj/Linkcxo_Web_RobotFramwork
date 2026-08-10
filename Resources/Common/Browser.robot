*** Settings ***
Library    SeleniumLibrary

Resource    ../Variables/Config.robot

*** Keywords ***

Open Application
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Close Application
    Capture Page Screenshot
    Close Browser