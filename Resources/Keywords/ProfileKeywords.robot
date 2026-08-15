*** Settings ***
Documentation    Business-flow keywords for updating User Profile details.
Resource    ../Pages/ProfilePage.robot
Resource    ../Variables/TestData.robot

*** Keywords ***

Update Profile Image Banner And Summary Details
    [Documentation]    Update profile image, banner and additional profile information.
    ProfilePage.Upload Profile Image                ${PROFILE_PHOTO_PATH}
    ProfilePage.Update Profile Banner Image         ${PROFILE_BANNER_PATH}
    Sleep    10s
    ProfilePage.Open Additional Information Modal
    ProfilePage.Fill Additional Email If Blank      ${PROFILE_UPDATE_LOGIN_EMAIL}
    ProfilePage.Enter Preferred Location Value      ${PROFILE_UPDATE_PREFERRED_LOCATION}
    ProfilePage.Select Last Salary Range            ${PROFILE_UPDATE_LAST_SALARY}
    ProfilePage.Upload Resume Document              ${PROFILE_UPDATE_RESUME}
    ProfilePage.Select Preferred Industry Option    ${PROFILE_UPDATE_PREFERRED_INDUSTRY}
    ProfilePage.Select Open For Relocation Yes
    ProfilePage.Select Notice Period Yes
    ProfilePage.Click Additional Info Save Button

Add User Education Details
    [Documentation]    Opens Add Education modal, fills degree,
    ...    institution, field of study, location, and start/end
    ...    dates, then saves.
    ProfilePage.Click Add Education Button
    ProfilePage.Enter Education Degree            ${EDU_DEGREE}
    ProfilePage.Enter Education Institution       ${EDU_INSTITUTION}
    ProfilePage.Enter Education Field Of Study    ${EDU_FIELD_OF_STUDY}
    ProfilePage.Enter Education Location          ${EDU_LOCATION}
    ProfilePage.Select Education Start Date       ${EDU_START_MONTH}    ${EDU_START_YEAR}
    ProfilePage.Select Education End Date         ${EDU_END_MONTH}      ${EDU_END_YEAR}
    ProfilePage.Click Add Education Save Button
    ProfilePage.Refresh Profile Page
    ProfilePage.Click Experience Tab

Add User Experience Details
    [Documentation]    Adds the current Zonal Head experience record.
    ProfilePage.Click Add Experience Button
    ProfilePage.Enter Experience Details    ${EXP_JOB_TITLE}    ${EXP_DESCRIPTION}    ${EXP_COMPANY_NAME}    ${EXP_LOCATION}
    ProfilePage.Select Experience Start Date    ${EXP_START_MONTH}    ${EXP_START_YEAR}
    ProfilePage.Select Currently Working Here
    ProfilePage.Click Add Experience Save Button

Add User Award And Certification
    [Documentation]    Adds an award/certification record to the profile.
    ProfilePage.Click Awards And Certification Tab
    ProfilePage.Click Add Award Button
    ProfilePage.Enter Award Details    ${AWARD_TITLE}    ${AWARD_CERTIFIED_BY}    ${AWARD_ISSUED_DATE}    ${AWARD_DESCRIPTION}
    ProfilePage.Click Add Award Save Button

Add User Publication
    [Documentation]    Adds a publication record to the profile.
    ProfilePage.Click Publications Tab
    ProfilePage.Click Add Publication Button
    ProfilePage.Enter Publication Details    ${PUBLICATION_TITLE}    ${PUBLICATION_PUBLISHED_BY}    ${PUBLICATION_PUBLISHED_ON}    ${PUBLICATION_DESCRIPTION}
    ProfilePage.Click Add Publication Save Button

Add User English Language
    [Documentation]    Adds English with reading, writing and speaking proficiencies.
    ProfilePage.Click Languages Tab
    ProfilePage.Click Edit Languages Button
    ProfilePage.Add English Language With All Proficiencies
    ProfilePage.Click Add Language Save Button

Update User About Description
    [Documentation]    Replaces About description, skills, and interests, then saves it.
    ProfilePage.Open About Edit Modal
    ProfilePage.Enter About Description    ${PROFILE_ABOUT_DESCRIPTION}
    ProfilePage.Reset And Add About Skills    @{PROFILE_ABOUT_SKILLS}
    ProfilePage.Reset And Add About Interests    @{PROFILE_ABOUT_INTERESTS}
    ProfilePage.Click About Save Button
