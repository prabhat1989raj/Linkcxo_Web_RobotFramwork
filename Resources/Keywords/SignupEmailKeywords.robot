*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/TestData.robot

*** Variables ***

${LOGIN_BUTTON}                xpath=(//button[text()='Login'])[1]
${EMAIL_INPUT}                 xpath=//input[@id='emailId']
${CONTINUE_BUTTON}             xpath=//button[normalize-space()='Continue']

${OTP_INPUTS}                  xpath=//input[starts-with(@name,'otp-input-')]
${OTP_CONTINUE_BUTTON}         xpath=//button[@id='continue-btn']

${FIRST_NAME}                  xpath=//input[@id='firstName']
${LAST_NAME}                   xpath=//input[@id='lastName']
${COMPANY_NAME}                xpath=//input[@id='companyName']

${DESIGNATION_DROPDOWN}        xpath=//label[contains(text(),'Designation')]/following::div[1]
${MARKETING_HEAD}              xpath=//div[@role='option'][1]

${YEARS_OF_EXPERIENCE}         xpath=//input[@id='yearsOfExperience']
${PHONE_NUMBER}                xpath=//input[@id='phoneNo']
${LINKEDIN_LINK}                xpath=//input[@id='linkedInLink']

${CHECKBOX}                    xpath=//div[@id='checkBox']

${FINAL_CONTINUE_BUTTON}       xpath=//button[normalize-space()='Continue']


*** Keywords ***

Validate Signup Email
    [Arguments]    ${email}
    Should Match Regexp    ${email}    ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$

Signup Using Email

    Wait Until Page Contains Element    xpath=//body    30s

    Wait Until Element Is Visible    ${LOGIN_BUTTON}    30s
    Scroll Element Into View         ${LOGIN_BUTTON}
    Click Element                    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${EMAIL_INPUT}    30s
    Validate Signup Email             ${SIGNUP_EMAIL}
    Input Text                       ${EMAIL_INPUT}    ${SIGNUP_EMAIL}

    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    20s
    Click Element                    ${CONTINUE_BUTTON}

    Submit OTP

    Wait Until Element Is Visible    ${FIRST_NAME}    30s
    Input Text                       ${FIRST_NAME}    Raj

    Wait Until Element Is Visible    ${LAST_NAME}    20s
    Input Text                       ${LAST_NAME}    Kumar

    Wait Until Element Is Visible    ${COMPANY_NAME}    20s
    Input Text                       ${COMPANY_NAME}    Alfatech Private Limited

    Wait Until Element Is Visible    ${DESIGNATION_DROPDOWN}    20s
    Click Element                    ${DESIGNATION_DROPDOWN}

    Wait Until Element Is Visible    ${MARKETING_HEAD}    20s
    Click Element                    ${MARKETING_HEAD}

    Wait Until Element Is Visible    ${YEARS_OF_EXPERIENCE}    20s
    Input Text                       ${YEARS_OF_EXPERIENCE}    14

    Wait Until Element Is Visible    ${PHONE_NUMBER}    20s
    Input Text                       ${PHONE_NUMBER}    ${SIGNUP_EMAIL_MOBILE}

    Wait Until Element Is Visible    ${LINKEDIN_LINK}    20s
    Input Text
    ...    ${LINKEDIN_LINK}
    ...    https://www.linkedin.com/in/prabhat-kumar-b12699129/

    Wait Until Element Is Visible    ${FINAL_CONTINUE_BUTTON}    20s
    Click Element                    ${FINAL_CONTINUE_BUTTON}

    Sleep    15s

    Capture Page Screenshot


Submit OTP

    Wait Until Element Is Visible    ${OTP_INPUTS}    30s

    @{otp}=    Get WebElements    ${OTP_INPUTS}

    Input Text    ${otp}[0]    4
    Input Text    ${otp}[1]    4
    Input Text    ${otp}[2]    4
    Input Text    ${otp}[3]    4
    Input Text    ${otp}[4]    4
    Input Text    ${otp}[5]    4

    Sleep   10s

    Wait Until Element Is Visible    ${OTP_CONTINUE_BUTTON}    20s
    Click Element                    ${OTP_CONTINUE_BUTTON}
