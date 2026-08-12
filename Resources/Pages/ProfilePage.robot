*** Settings ***
Documentation    Low-level element actions for User Profile page.
Library          SeleniumLibrary
Resource         ../Variables/Locators.robot
Resource         ../Variables/Config.robot


*** Keywords ***

# ============================================================
# PROFILE HEADER
# ============================================================

Click User Profile Icon
    Maximize Browser Window
    Wait Until Element Is Visible    ${USER_PROFILE_LINK}    timeout=30s
    Click Element    ${USER_PROFILE_LINK}


# ============================================================
# PROFILE IMAGE
# ============================================================

Upload Profile Image
    [Arguments]    ${file_path}
    Wait Until Page Contains Element    ${PROFILE_IMAGE_INPUT}    timeout=30s
    Choose File    ${PROFILE_IMAGE_INPUT}    ${file_path}


# ============================================================
# PROFILE BANNER
# ============================================================

Update Profile Banner Image
    [Arguments]    ${file_path}
    Wait Until Page Contains Element    ${PROFILE_BANNER_IMAGE_INPUT}    timeout=30s
    Choose File    ${PROFILE_BANNER_IMAGE_INPUT}    ${file_path}


# ============================================================
# ADDITIONAL INFORMATION - OPEN MODAL
# ============================================================

Open Additional Information Modal
    Wait Until Element Is Visible    ${ADDITIONAL_INFO_EDIT_ICON}    timeout=30s
    Click Element    ${ADDITIONAL_INFO_EDIT_ICON}
    Wait Until Element Is Visible    ${ADDITIONAL_INFO_EMAIL_INPUT}    timeout=30s


# ============================================================
# EMAIL
# ============================================================

Fill Additional Email If Blank
    [Arguments]    ${email_value}
    ${current_email}=    Get Value    ${ADDITIONAL_INFO_EMAIL_INPUT}
    IF    '${current_email}' == ''
        Input Text    ${ADDITIONAL_INFO_EMAIL_INPUT}    ${email_value}
    END


# ============================================================
# PREFERRED LOCATION
# ============================================================

Enter Preferred Location Value
    [Arguments]    ${location}
    Wait Until Element Is Visible    ${PREFERRED_LOCATION_INPUT}    timeout=30s
    Click Element    ${PREFERRED_LOCATION_INPUT}
    Input Text    ${PREFERRED_LOCATION_INPUT}    ${location}
    Wait Until Element Is Visible    xpath=//div[starts-with(@id,'react-select-4-option') and normalize-space()='${location}']    timeout=5s
    Click Element    xpath=//div[starts-with(@id,'react-select-4-option') and normalize-space()='${location}']


# ============================================================
# LAST SALARY
# ============================================================

Select Last Salary Range
    [Arguments]    ${salary_range}
    Wait Until Element Is Visible    ${LAST_SALARY_DROPDOWN}    timeout=30s
    Select From List By Label    ${LAST_SALARY_DROPDOWN}    ${salary_range}


# ============================================================
# RESUME
# ============================================================

Upload Resume Document
    [Arguments]    ${file_path}
    Wait Until Page Contains Element    ${RESUME_FILE_INPUT}    timeout=30s
    Choose File    ${RESUME_FILE_INPUT}    ${file_path}


# ============================================================
# PREFERRED INDUSTRY
# ============================================================

Select Preferred Industry Option
    [Arguments]    ${industry}
    Wait Until Element Is Visible    ${PREFERRED_INDUSTRY_INPUT}    timeout=30s
    Click Element    ${PREFERRED_INDUSTRY_INPUT}
    Input Text    ${PREFERRED_INDUSTRY_INPUT}    ${industry}
    Wait Until Element Is Visible    xpath=//div[starts-with(@id,'react-select-3-option') and normalize-space()='${industry}']    timeout=5s
    Click Element    xpath=//div[starts-with(@id,'react-select-3-option') and normalize-space()='${industry}']


# ============================================================
# OPEN FOR RELOCATION
# ============================================================

Select Open For Relocation Yes
    Wait Until Element Is Visible    ${RELOCATION_YES_RADIO}    timeout=30s
    Click Element    ${RELOCATION_YES_RADIO}


# ============================================================
# NOTICE PERIOD
# ============================================================

Select Notice Period Yes
    Wait Until Element Is Visible    ${NOTICE_PERIOD_YES_RADIO}    timeout=30s
    Click Element    ${NOTICE_PERIOD_YES_RADIO}


# ============================================================
# SAVE ADDITIONAL INFORMATION
# ============================================================

Click Additional Info Save Button
    Wait Until Element Is Visible    ${ADDITIONAL_INFO_SAVE_BTN}    timeout=30s
    Click Element    ${ADDITIONAL_INFO_SAVE_BTN}
