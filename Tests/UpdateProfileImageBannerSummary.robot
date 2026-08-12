*** Settings ***
Documentation    Test suite for Profile Image, Banner and Summary update.

Resource    ../Resources/Common/Browser.robot
Resource    ../Resources/Keywords/ProfileKeywords.robot
Resource    ../Resources/Pages/ProfilePage.robot
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Variables/Locators.robot
Resource    ../Resources/Variables/TestData.robot

Suite Setup    Open Browser And Maximize
# Suite Teardown    Close Browser


*** Test Cases ***
Update Profile Image Banner And Summary Successfully
    [Documentation]    Login and update profile image, banner and summary details.
    [Tags]    regression    profile

    Login To Application    email=${PROFILE_UPDATE_LOGIN_EMAIL}
    Click User Profile Icon
    Update Profile Image Banner And Summary Details


*** Keywords ***
Open Browser And Maximize
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Update Profile Image Banner And Summary Details
    ProfilePage.Upload Profile Image              ${PROFILE_PHOTO_PATH}
    ProfilePage.Update Profile Banner Image       ${PROFILE_BANNER_PATH}
    ProfilePage.Open Additional Information Modal
    ProfilePage.Fill Additional Email If Blank    ${PROFILE_UPDATE_LOGIN_EMAIL}
    ProfilePage.Enter Preferred Location Value    ${PROFILE_UPDATE_PREFERRED_LOCATION}
    ProfilePage.Select Last Salary Range           ${PROFILE_UPDATE_LAST_SALARY}
    ProfilePage.Upload Resume Document             ${PROFILE_UPDATE_RESUME}
    ProfilePage.Select Preferred Industry Option  ${PROFILE_UPDATE_PREFERRED_INDUSTRY}
    ProfilePage.Select Open For Relocation Yes
    ProfilePage.Select Notice Period Yes
    ProfilePage.Click Additional Info Save Button