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
    