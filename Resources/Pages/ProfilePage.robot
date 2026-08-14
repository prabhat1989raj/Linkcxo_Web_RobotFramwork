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
    Clear Element Text    ${ADDITIONAL_INFO_EMAIL_INPUT}
    Input Text    ${ADDITIONAL_INFO_EMAIL_INPUT}    ${email_value}


# ============================================================
# PREFERRED LOCATION
# ============================================================

Enter Preferred Location Value
    [Arguments]    ${location}
    Wait Until Element Is Visible    ${PREFERRED_LOCATION_CONTAINER}    timeout=30s
    Click Element    ${PREFERRED_LOCATION_CONTAINER}
    Wait Until Element Is Visible    ${PREFERRED_LOCATION_INPUT}    timeout=10s
    Input Text    ${PREFERRED_LOCATION_INPUT}    ${location}
    Wait Until Element Is Visible    xpath=//div[contains(@id,'-option') and normalize-space()='${location}']    timeout=20s
    Click Element    xpath=//div[contains(@id,'-option') and normalize-space()='${location}']

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
    Wait Until Element Is Visible    xpath=//div[contains(@id,'-option') and normalize-space()='${industry}']    timeout=20s
    Click Element    xpath=//div[contains(@id,'-option') and normalize-space()='${industry}']

# ============================================================
# OPEN FOR RELOCATION
# ============================================================

Select Open For Relocation Yes
    Scroll Element Into View    ${RELOCATION_YES_RADIO}
    Wait Until Element Is Visible    ${RELOCATION_YES_RADIO}    timeout=30s
    Click Element    ${RELOCATION_YES_RADIO}

# ============================================================
# NOTICE PERIOD
# ============================================================

Select Notice Period Yes
    Scroll Element Into View    ${NOTICE_PERIOD_YES_RADIO}
    Wait Until Element Is Visible    ${NOTICE_PERIOD_YES_RADIO}    timeout=30s
    Click Element    ${NOTICE_PERIOD_YES_RADIO}



# ============================================================
# SAVE ADDITIONAL INFORMATION
# ============================================================

Click Additional Info Save Button
    Scroll Element Into View    ${ADDITIONAL_INFO_SAVE_BTN}
    Wait Until Element Is Visible    ${ADDITIONAL_INFO_SAVE_BTN}    timeout=30s
    Click Element    ${ADDITIONAL_INFO_SAVE_BTN}
    ${modal_closed}=    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${ADDITIONAL_INFO_MODAL_TITLE}    timeout=5s
    IF    not ${modal_closed}
        Wait Until Keyword Succeeds    10s    1s    Click Element    ${ADDITIONAL_INFO_CLOSE_BTN}
        Wait Until Element Is Not Visible    ${ADDITIONAL_INFO_MODAL_TITLE}    timeout=10s
    END
    Sleep    10s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)


# ============================================================
# ABOUT
# ============================================================

Open About Edit Modal
    Wait Until Element Is Visible    ${ABOUT_EDIT_ICON}    timeout=30s
    Click Element    ${ABOUT_EDIT_ICON}
    Wait Until Element Is Visible    ${ABOUT_DESCRIPTION_INPUT}    timeout=30s

Enter About Description
    [Arguments]    ${description}
    Clear Element Text    ${ABOUT_DESCRIPTION_INPUT}
    Input Text    ${ABOUT_DESCRIPTION_INPUT}    ${description}

Reset And Add About Skills
    [Arguments]    @{skills}
    Clear About Multi Select Values    ${ABOUT_SKILLS_INPUT}
    FOR    ${skill}    IN    @{skills}
        Add About Multi Select Value    ${ABOUT_SKILLS_INPUT}    ${skill}
    END

Reset And Add About Interests
    [Arguments]    @{interests}
    Clear About Multi Select Values    ${ABOUT_INTERESTS_INPUT}
    FOR    ${interest}    IN    @{interests}
        Add About Multi Select Value    ${ABOUT_INTERESTS_INPUT}    ${interest}
    END

Clear About Multi Select Values
    [Arguments]    ${input}
    Click Element    ${input}
    FOR    ${index}    IN RANGE    10
        Press Keys    ${input}    BACKSPACE
    END

Add About Multi Select Value
    [Arguments]    ${input}    ${value}
    Wait Until Element Is Visible    ${input}    timeout=10s
    Click Element    ${input}
    Input Text    ${input}    ${value}
    Wait Until Element Is Visible    xpath=(//button[normalize-space()='+ ${value}'])[1]    timeout=10s
    Click Element    xpath=(//button[normalize-space()='+ ${value}'])[1]

Click About Save Button
    Execute JavaScript    const button = Array.from(document.querySelectorAll('button[type="submit"]')).find(el => el.textContent.trim() === 'Save Changes'); if (button) { button.scrollIntoView({block: 'center'}); }
    Wait Until Page Contains Element    ${ABOUT_SAVE_BTN}    timeout=30s
    Scroll Element Into View    ${ABOUT_SAVE_BTN}
    Wait Until Element Is Visible    ${ABOUT_SAVE_BTN}    timeout=10s
    Click Element    ${ABOUT_SAVE_BTN}
    Reload Page
    Sleep    10s
    Wait Until Element Is Visible    ${EDUCATION_TAB}    timeout=30s
    Click Element    ${EDUCATION_TAB}

# ============================================================
# EDUCATION
# ============================================================

Click Add Education Button
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Wait Until Element Is Visible    ${EDUCATION_ADD_BTN}    timeout=30s
    Scroll Element Into View    ${EDUCATION_ADD_BTN}
    Click Element    ${EDUCATION_ADD_BTN}
    Wait Until Element Is Visible    ${ADD_EDUCATION_MODAL_TITLE}    timeout=10s

Enter Education Degree
    [Arguments]    ${degree}
    Wait Until Element Is Visible    ${EDU_DEGREE_INPUT}    timeout=30s
    Clear Element Text    ${EDU_DEGREE_INPUT}
    Input Text    ${EDU_DEGREE_INPUT}    ${degree}

Enter Education Institution
    [Arguments]    ${institution}
    Wait Until Element Is Visible    ${EDU_INSTITUTION_INPUT}    timeout=30s
    Clear Element Text    ${EDU_INSTITUTION_INPUT}
    Input Text    ${EDU_INSTITUTION_INPUT}    ${institution}

Enter Education Field Of Study
    [Arguments]    ${field_of_study}
    Wait Until Element Is Visible    ${EDU_FIELD_OF_STUDY_INPUT}    timeout=30s
    Clear Element Text    ${EDU_FIELD_OF_STUDY_INPUT}
    Input Text    ${EDU_FIELD_OF_STUDY_INPUT}    ${field_of_study}

Enter Education Location
    [Arguments]    ${location}
    Wait Until Element Is Visible    ${EDU_LOCATION_INPUT}    timeout=30s
    Clear Element Text    ${EDU_LOCATION_INPUT}
    Input Text    ${EDU_LOCATION_INPUT}    ${location}

Select Education Start Date
    [Arguments]    ${month}    ${year}
    Wait Until Element Is Visible    ${EDU_START_MONTH_DROPDOWN}    timeout=30s
    Wait Until Element Is Visible    ${EDU_START_YEAR_DROPDOWN}    timeout=30s
    Select Education Date Dropdown Value    ${EDU_START_MONTH_DROPDOWN}    ${month}
    Select Education Date Dropdown Value    ${EDU_START_YEAR_DROPDOWN}    ${year}

Select Education End Date
    [Arguments]    ${month}    ${year}
    Wait Until Element Is Visible    ${EDU_END_MONTH_DROPDOWN}    timeout=30s
    Wait Until Element Is Visible    ${EDU_END_YEAR_DROPDOWN}    timeout=30s
    Select Education Date Dropdown Value    ${EDU_END_MONTH_DROPDOWN}    ${month}
    Select Education Date Dropdown Value    ${EDU_END_YEAR_DROPDOWN}    ${year}

Select Education Date Dropdown Value
    [Arguments]    ${dropdown}    ${value}
    Click Element    ${dropdown}
    Wait Until Element Is Visible    xpath=(//*[@role='option' and normalize-space()='${value}'])[1]    timeout=10s
    Click Element    xpath=(//*[@role='option' and normalize-space()='${value}'])[1]

Click Add Education Save Button
    Scroll Element Into View    ${EDU_SAVE_BTN}
    Click Element    ${EDU_SAVE_BTN}

Refresh Profile Page
    Reload Page
    Wait Until Element Is Visible    ${EXPERIENCE_TAB}    timeout=30s

Click Experience Tab
    Wait Until Element Is Visible    ${EXPERIENCE_TAB}    timeout=30s
    Scroll Element Into View    ${EXPERIENCE_TAB}
    Click Element    ${EXPERIENCE_TAB}

Click Add Experience Button
    Wait Until Element Is Visible    ${EXPERIENCE_ADD_BTN}    timeout=30s
    Scroll Element Into View    ${EXPERIENCE_ADD_BTN}
    Click Element    ${EXPERIENCE_ADD_BTN}
    Wait Until Element Is Visible    ${ADD_EXPERIENCE_MODAL_TITLE}    timeout=10s

Enter Experience Details
    [Arguments]    ${job_title}    ${description}    ${company_name}    ${location}
    Input Text    ${EXP_JOB_TITLE_INPUT}    ${job_title}
    Input Text    ${EXP_DESCRIPTION_INPUT}    ${description}
    Input Text    ${EXP_COMPANY_NAME_INPUT}    ${company_name}
    Input Text    ${EXP_LOCATION_INPUT}    ${location}

Select Experience Start Date
    [Arguments]    ${month}    ${year}
    Select Experience Date Value    ${EXP_START_MONTH_DROPDOWN}    ${month}
    Select Experience Date Value    ${EXP_START_YEAR_DROPDOWN}    ${year}

Select Experience Date Value
    [Arguments]    ${dropdown}    ${value}
    Click Element    ${dropdown}
    Wait Until Element Is Visible    xpath=(//*[@role='option' and normalize-space()='${value}'])[1]    timeout=10s
    Click Element    xpath=(//*[@role='option' and normalize-space()='${value}'])[1]

Select Currently Working Here
    Select Checkbox    ${EXP_CURRENTLY_WORKING}

Click Add Experience Save Button
    Wait Until Element Is Visible    ${EXP_SAVE_BTN}    timeout=30s
    Click Element    ${EXP_SAVE_BTN}
    Refresh Profile Page

