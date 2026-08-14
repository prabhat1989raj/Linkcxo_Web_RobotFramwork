*** Settings ***
Documentation    Test suite for updating complete user profile details.
Library          SeleniumLibrary
Resource         ../Resources/Keywords/ProfileKeywords.robot
Resource         ../Resources/Common/Browser.robot
Resource         ../Resources/Pages/ProfilePage.robot
Resource         ../Resources/Pages/LoginPage.robot
Resource         ../Resources/Variables/Locators.robot
Resource         ../Resources/Variables/TestData.robot
Resource         ../Resources/Variables/Config.robot
Suite Setup      Open Application
Suite Teardown   Close Browser

*** Test Cases ***
Update Profile Successfully
    [Documentation]    Login and update all profile sections.
    [Tags]    regression    profile
    Maximize Browser Window
    Login To Application    email=${PROFILE_UPDATE_LOGIN_EMAIL}
    Click User Profile Icon
    Update Profile Image Banner And Summary Details
    Update User About Description
    Add User Education Details
    Add User Experience Details
    Add User Award And Certification
    Add User Publication
    Add User English Language


