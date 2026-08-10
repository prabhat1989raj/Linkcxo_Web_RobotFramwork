*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${LOGIN_BUTTON}                xpath=(//button[text()='Login'])[1]
${MOBILE_TOGGLE}               xpath=//button[normalize-space()='Mobile']
${MOBILE_INPUT}                xpath=//input[@placeholder='Enter Your Mobile Number']
${CONTINUE_BUTTON}             xpath=//button[normalize-space()='Continue']

${OTP_INPUTS}                  xpath=//input[starts-with(@name,'otp-input-')]
${OTP_CONTINUE_BUTTON}         xpath=//button[@id='continue-btn']

${FIRST_NAME}                  xpath=//input[@id='firstName']
${LAST_NAME}                   xpath=//input[@id='lastName']
${TELL_US_EMAIL}               xpath=//input[@placeholder='Enter your email id']
${COMPANY_NAME}                xpath=//input[@id='companyName']

${DESIGNATION_DROPDOWN}        xpath=//label[contains(text(),'Designation')]/following::div[1]
${MARKETING_HEAD}              xpath=//div[@role='option'][1]

${YEARS_OF_EXPERIENCE}         xpath=//input[@id='yearsOfExperience']
${LINKEDIN_LINK}                xpath=//input[@id='linkedInLink']

${FINAL_CONTINUE_BUTTON}       xpath=//button[normalize-space()='Continue']


*** Keywords ***

Signup Using Mobile

    Wait Until Page Contains Element    xpath=//body    30s

    Wait Until Element Is Visible    ${LOGIN_BUTTON}    30s
    Scroll Element Into View         ${LOGIN_BUTTON}
    Click Element                    ${LOGIN_BUTTON}

    Wait Until Element Is Visible    ${MOBILE_TOGGLE}    20s
    Click Element                    ${MOBILE_TOGGLE}

    Wait Until Element Is Visible    ${MOBILE_INPUT}    20s
    Input Text                       ${MOBILE_INPUT}    8969218655

    Wait Until Element Is Visible    ${CONTINUE_BUTTON}    20s
    Click Element                    ${CONTINUE_BUTTON}

    Submit OTP

    Wait Until Element Is Visible    ${FIRST_NAME}    30s
    Input Text                       ${FIRST_NAME}    Raj

    Wait Until Element Is Visible    ${LAST_NAME}    20s
    Input Text                       ${LAST_NAME}    Kumar

    Wait Until Element Is Visible    ${TELL_US_EMAIL}    20s
    Input Text                       ${TELL_US_EMAIL}    raj12389@gmail.com

    Wait Until Element Is Visible    ${COMPANY_NAME}    20s
    Input Text                       ${COMPANY_NAME}    Alfatech Private Limited

    Wait Until Element Is Visible    ${DESIGNATION_DROPDOWN}    20s
    Click Element                    ${DESIGNATION_DROPDOWN}

    Wait Until Element Is Visible    ${MARKETING_HEAD}    20s
    Click Element                    ${MARKETING_HEAD}

    Wait Until Element Is Visible    ${YEARS_OF_EXPERIENCE}    20s
    Input Text                       ${YEARS_OF_EXPERIENCE}    14

    Wait Until Element Is Visible    ${LINKEDIN_LINK}    20s
    Input Text
    ...    ${LINKEDIN_LINK}
    ...    https://www.linkedin.com/in/prabhat-kumar-b12699129/

    Wait Until Element Is Visible    ${FINAL_CONTINUE_BUTTON}    20s
    Click Element                    ${FINAL_CONTINUE_BUTTON}

    Sleep    5s

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

    Sleep    2s

    Wait Until Element Is Visible    ${OTP_CONTINUE_BUTTON}    20s
    Click Element                    ${OTP_CONTINUE_BUTTON}