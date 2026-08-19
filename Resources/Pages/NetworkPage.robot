*** Settings ***
Documentation    Navigation keyword for the Network module.

Library          SeleniumLibrary

Resource         ../Variables/Config.robot


*** Variables ***

${NETWORK_TAB}                       xpath=//div[contains(@class,'text-xs') and normalize-space()='Network']
${CONNECT_BUTTON}                    xpath=//button[normalize-space()='Connect']
${ALL_CONNECTIONS_BUTTON}            xpath=//button[normalize-space()='All Connections']
${PENDING_REQUEST_BUTTON}            xpath=//button[normalize-space()='Pending Request']
${SENT_REQUEST_BUTTON}               xpath=//button[normalize-space()='Sent Request']

${FIRST_CONNECTION_OPTIONS_BUTTON}   xpath=(//button[.//*[name()='path' and contains(@d,'M0 1.75C0 1.28587')]])[1]

${REMOVE_CONNECTION_BUTTON}          xpath=//*[self::button or @role='menuitem'][normalize-space()='Remove']
${CANCEL_SENT_REQUEST_BUTTON}        xpath=//button[normalize-space()='Cancel']


*** Keywords ***

Open Network Module
    Wait Until Element Is Visible    ${NETWORK_TAB}    ${TIMEOUT}
    Scroll Element Into View         ${NETWORK_TAB}
    Click Element                    ${NETWORK_TAB}


Connect With First Two Users
    Wait Until Element Is Visible    ${CONNECT_BUTTON}    ${TIMEOUT}

    Click First Available Connect Button
    Sleep    10s

    Click First Available Connect Button
    Sleep    10s


Click First Available Connect Button
    Wait Until Element Is Visible    ${CONNECT_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${CONNECT_BUTTON}
    Click Element                    ${CONNECT_BUTTON}


Open All Connections
    Wait Until Element Is Visible    ${ALL_CONNECTIONS_BUTTON}    ${TIMEOUT}
    Click Element                    ${ALL_CONNECTIONS_BUTTON}


Remove First Connection
    Wait Until Element Is Visible    ${FIRST_CONNECTION_OPTIONS_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${FIRST_CONNECTION_OPTIONS_BUTTON}
    Click Element                    ${FIRST_CONNECTION_OPTIONS_BUTTON}

    Sleep    10s

    Wait Until Element Is Visible    ${REMOVE_CONNECTION_BUTTON}    ${TIMEOUT}
    Click Element                    ${REMOVE_CONNECTION_BUTTON}

    Sleep    10s


Open Pending Requests
    Wait Until Element Is Visible    ${PENDING_REQUEST_BUTTON}    ${TIMEOUT}
    Click Element                    ${PENDING_REQUEST_BUTTON}


Open Sent Requests
    Wait Until Element Is Visible    ${SENT_REQUEST_BUTTON}    ${TIMEOUT}
    Click Element                    ${SENT_REQUEST_BUTTON}


Cancel First Two Sent Requests
    Cancel First Available Sent Request
    Cancel First Available Sent Request


Cancel First Available Sent Request
    Wait Until Element Is Visible    ${FIRST_CONNECTION_OPTIONS_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${FIRST_CONNECTION_OPTIONS_BUTTON}
    Click Element                    ${FIRST_CONNECTION_OPTIONS_BUTTON}

    Sleep    10s

    Wait Until Element Is Visible    ${CANCEL_SENT_REQUEST_BUTTON}    ${TIMEOUT}
    Click Element                    ${CANCEL_SENT_REQUEST_BUTTON}

    Sleep    10s