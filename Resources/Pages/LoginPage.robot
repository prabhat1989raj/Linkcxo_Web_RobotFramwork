*** Settings ***
Library    SeleniumLibrary
Resource    ../Common/Browser.robot
Resource    ../Variables/Config.robot
Resource    ../Variables/TestData.robot
Resource    ../Variables/Locators.robot

*** Keywords ***

Login To Application
    [Arguments]    ${email}=${EMAIL}
    Wait Until Element Is Visible    ${LOGIN_BUTTON}    ${TIMEOUT}
    Click Element    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${EMAIL_INPUT}    ${TIMEOUT}
    Input Text    ${EMAIL_INPUT}    ${email}

    Wait Until Element Is Enabled    ${CONTINUE_BUTTON}    ${TIMEOUT}
    Click Element    ${CONTINUE_BUTTON}

    Wait Until Element Is Visible    ${OTP_INPUT_1}    ${TIMEOUT}
    Set Selenium Speed    0s

    Input Text    ${OTP_INPUT_1}    4
    Input Text    ${OTP_INPUT_2}    4
    Input Text    ${OTP_INPUT_3}    4
    Input Text    ${OTP_INPUT_4}    4
    Input Text    ${OTP_INPUT_5}    4
    Input Text    ${OTP_INPUT_6}    4
    Execute JavaScript
    ...    document.evaluate("${VERIFY_BUTTON_XPATH}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Set Selenium Speed    ${ACTION_DELAY}

    Wait Until Page Contains Element    ${HOME_PAGE}    ${TIMEOUT}
    Wait Until Element Is Visible    ${USER_PROFILE_LINK}    timeout=15s
