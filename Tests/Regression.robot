*** Settings ***
Documentation    LinkCXO Complete End-to-End Regression Suite

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
Resource    ../Resources/Pages/JobPage.robot
Resource    ../Resources/Keywords/ProfileKeywords.robot
Resource    ../Resources/Pages/ProfilePage.robot
Resource    ../Resources/Pages/NetworkPage.robot
Resource    ../Resources/Pages/RewardsPage.robot
Resource    ../Resources/Pages/CompanyPage.robot
Resource    ../Resources/Variables/Locators.robot
Resource    ../Resources/Variables/TestData.robot

Test Setup       Open Application
Test Teardown    Safe Close Application


*** Keywords ***

Safe Close Application
    ${status}=    Run Keyword And Return Status    Close Application
    Log    Browser close status: ${status}


*** Test Cases ***

Signup With Email
    [Documentation]    Verifies a new user can sign up using email and OTP verification.
    [Tags]    signup    email

    Signup Using Email


Signup With Mobile
    [Documentation]    Verifies a new user can sign up using mobile number and OTP verification.
    [Tags]    signup    mobile

    Signup Using Mobile


Login With Email
    [Documentation]    Verifies login with the email-signup user.
    [Tags]    login    smoke

    Login To Application    email=${SIGNUP_EMAIL}
    Reload Page
    Wait Until Element Is Visible    ${USER_PROFILE_LINK}    timeout=15s


Update Profile Successfully
    [Documentation]    Verifies a user can update all profile sections.
    [Tags]    profile    content

    Login To Application    email=${PROFILE_UPDATE_LOGIN_EMAIL}

    Click User Profile Icon
    Update Profile Image Banner And Summary Details
    Update User About Description
    Add User Education Details
    Add User Experience Details
    Add User Award And Certification
    Add User Publication
    Add User English Language

    Capture Page Screenshot    ${OUTPUT DIR}/UpdateProfile.png


Create All Content With One Signup Login
    [Documentation]    Logs in once with the email-signup account, then creates every post-related content type in the same browser session.
    [Tags]    post    query    poll    article    survey    content

    Login To Application    email=${SIGNUP_EMAIL}

    Create New Post
    Capture Page Screenshot    ${OUTPUT DIR}/CreatePost.png

    Create Post With Document
    Capture Page Screenshot    ${OUTPUT DIR}/CreateDocumentPost.png

    Create Post With Video
    Capture Page Screenshot    ${OUTPUT DIR}/CreateVideoPost.png

    Create New Query
    Capture Page Screenshot    ${OUTPUT DIR}/CreateQuery.png

    Create New Poll
    Capture Page Screenshot    ${OUTPUT DIR}/CreatePoll.png

    Create New Article
    Capture Page Screenshot    ${OUTPUT DIR}/CreateArticle.png

    Create New Survey
    Capture Page Screenshot    ${OUTPUT DIR}/CreateSurvey.png


Create Public And Private Event Successfully
    [Documentation]    Verifies a user can create both Public and Private events.
    [Tags]    event    content

    Login To Application    email=${SIGNUP_EMAIL}

    Create New Event    ${EVENT_TYPE_PUBLIC}    ${EVENT_TITLE_PUBLIC}

    Sleep    15s

    Execute Javascript    window.scrollTo(0, 0);
    Sleep    2s

    Create New Event    ${EVENT_TYPE_PRIVATE}    ${EVENT_TITLE_PRIVATE}    ${TRUE}


Create Public And Private Club Successfully
    [Documentation]    Verifies a user can create both Public and Private clubs.
    [Tags]    club    content

    Login To Application    email=${SIGNUP_EMAIL}

    Create New Club

    Sleep    10s

    Execute Javascript    document.evaluate("//button[normalize-space()='Create Club']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    Create New Club    ${CLUB_TYPE_PRIVATE}


Bookmark And Apply To Recommended Job
    [Documentation]    Verifies bookmark, apply and LinkedIn job actions.
    [Tags]    jobs    regression

    Set Selenium Speed    2s

    Login To Application

    Reload Page
    Grant Location Permission
    Sleep    10s

    Open Recommended Jobs
    Bookmark Recommended Job

    ${jobs_window}=    Open External Job Application
    Return To Jobs Tab    ${jobs_window}

    Open All Jobs My Jobs And Social Posts
    Bookmark Recommended Job

    ${jobs_window}=    Open Social Post
    Return To Jobs Tab    ${jobs_window}


Network Then Direct Rewards Purchase End To End
    [Documentation]    Login once, complete the Network flow, then buy a reward directly with BUY NOW in the same browser session.
    [Tags]    regression    network    rewards    e2e

    # ============================================================
    # ONE LOGIN FOR NETWORK + REWARDS
    # ============================================================

    Login To Application    email=kprabhat956@gmail.com

    Sleep    5s


    # ============================================================
    # NETWORK MODULE
    # ============================================================

    Reload Page
    Sleep    10s

    Open Network Module
    Sleep    10s

    Connect With First Two Users
    Sleep    5s

    Open All Connections
    Sleep    10s

    Remove First Connection
    Sleep    5s

    Open Pending Requests
    Sleep    10s

    Open Sent Requests
    Sleep    10s

    Cancel First Two Sent Requests
    Sleep    5s

    Capture Page Screenshot    ${OUTPUT DIR}/Network.png


    # ============================================================
    # MOVE TO REWARDS
    # SAME BROWSER
    # SAME LOGIN SESSION
    # ============================================================

    Reload Page
    Sleep    6s


    # ============================================================
    # REWARDS MODULE
    # ============================================================

    Open Rewards Module
    Sleep    6s


    # ============================================================
    # REWARDS CATEGORIES
    # ============================================================

    Browse All Reward Categories
    Sleep    5s

    Open All Reward Categories
    Sleep    3s


    # ============================================================
    # SEARCH REWARD PRODUCT
    # ============================================================

    Search Reward Products    Running Shoes New model
    Sleep    5s


    # ============================================================
    # DIRECT CHECKOUT (BUY NOW — NO ADD TO CART)
    # ============================================================

    Open Checkout From Search Result
    Sleep    5s


    # ============================================================
    # DELIVERY ADDRESS
    # ============================================================

    Click Add New Delivery Address
    Sleep    3s

    Fill Delivery Address
    Sleep    3s

    Use This Delivery Address
    Sleep    3s

    Select Delivery Address Checkbox
    Sleep    3s


    # ============================================================
    # BILLING ADDRESS
    # ============================================================

    Open Billing Address
    Sleep    3s

    Select Same As Delivery Address
    Sleep    3s


    # ============================================================
    # PAYMENT
    # ============================================================

    Click Complete Secure Purchase
    Sleep    5s

    Verify Payment Options Are Open
    Sleep    3s

    Select Wallet Payment Option
    Sleep    3s

    Select Amazon Pay Wallet
    Sleep    3s

    Complete Mock Payment Successfully

    # ============================================================
    # COMPANIES MODULE
    # ============================================================

    Switch Window    MAIN
    Reload Page
    Wait Until Page Contains Element    ${COMPANIES_TAB}    20s
    Open Companies Module
    Follow First Discover Company
    Open Followed Companies
    Unfollow First Followed Company
    Reload Page
    Wait Until Page Contains Element    ${MY_COMPANIES_TAB}    20s
    Open My Companies
