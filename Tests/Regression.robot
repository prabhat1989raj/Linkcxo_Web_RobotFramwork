*** Settings ***
Documentation     LinkCXO Complete Regression Suite

Library    SeleniumLibrary

Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Keywords/SignupEmailKeywords.robot
Resource    ../Resources/Keywords/SignupMobileKeywords.robot
Resource    ../Resources/Keywords/PostKeywords.robot
Resource    ../Resources/Pages/QueryPage.robot
Resource    ../Resources/Pages/PollPage.robot
Resource    ../Resources/Pages/ArticlePage.robot
Resource    ../Resources/Pages/SurveyPage.robot
Resource    ../Resources/Pages/ClubPage.robot
Resource    ../Resources/Pages/EventPage.robot
Resource    ../Resources/Keywords/ProfileKeywords.robot
Resource    ../Resources/Pages/ProfilePage.robot
Resource    ../Resources/Variables/Locators.robot
Resource    ../Resources/Variables/TestData.robot

Test Setup       Open Application
Test Teardown    Close Application


*** Test Cases ***

Login With Email
    [Documentation]    Verifies a user can log in using their registered email
    [Tags]    login    smoke
    Login To Application

Signup With Email
    [Documentation]    Verifies a new user can sign up using email and OTP verification
    [Tags]    signup    email
    Signup Using Email

Signup With Mobile
    [Documentation]    Verifies a new user can sign up using mobile number and OTP verification
    [Tags]    signup    mobile
    Signup Using Mobile

Create Post After Login
    [Documentation]    Verifies a logged-in user can create a text/image post
    [Tags]    post    content
    Login To Application
    Create New Post
    Capture Page Screenshot    ${OUTPUT DIR}/CreatePost.png

Create Query Successfully
    [Documentation]    Verifies a user can create a query with category, question, and description
    [Tags]    query    content
    Login To Application
    Create New Query
    Capture Page Screenshot    ${OUTPUT DIR}/CreateQuery.png

Create Poll After Login
    [Documentation]    Verifies a user can create a poll
    [Tags]    poll    content
    Login To Application
    Create New Poll
    Capture Page Screenshot    ${OUTPUT DIR}/CreatePoll.png

Create Article Successfully
    [Documentation]    Verifies a user can create and publish an article
    [Tags]    article    content
    Login To Application
    Create New Article
    Capture Page Screenshot    ${OUTPUT DIR}/CreateArticle.png

Create Survey Successfully
    [Documentation]    Verifies a user can create a survey with questions and options
    [Tags]    survey    content
    Login To Application
    Create New Survey
    Capture Page Screenshot    ${OUTPUT DIR}/CreateSurvey.png

Create Public And Private Club Successfully
    [Documentation]    Verifies a user can create both a Public and a Private club
    [Tags]    club    content
    Login To Application
    Create New Club

    Sleep    10s

    Execute Javascript    document.evaluate("//button[normalize-space()='Create Club']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    Create New Club    ${CLUB_TYPE_PRIVATE}

Create Public And Private Event Successfully
    [Documentation]    Verifies a user can create both a Public and a Private event
    [Tags]    event    content
    Login To Application
    Create New Event    ${EVENT_TYPE_PUBLIC}    ${EVENT_TITLE_PUBLIC}

    Sleep    15s

    Execute Javascript    window.scrollTo(0, 0);
    Sleep    2s

    Create New Event    ${EVENT_TYPE_PRIVATE}    ${EVENT_TITLE_PRIVATE}    ${TRUE}

Update Profile Successfully
    [Documentation]    Verifies a user can update profile image, banner, and additional profile information
    [Tags]    profile    content
    Login To Application    email=${PROFILE_UPDATE_LOGIN_EMAIL}
    Click User Profile Icon
    Update Profile Image Banner And Summary Details
    Capture Page Screenshot    ${OUTPUT DIR}/UpdateProfile.png
