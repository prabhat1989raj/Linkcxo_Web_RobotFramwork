*** Settings ***
Documentation       Job-module test suite for recommended-job bookmark and external application flow.
Resource            ../Resources/Pages/LoginPage.robot
Resource            ../Resources/Pages/JobPage.robot

Suite Setup         Run Keywords    Open Application    AND    Login To Application    email=kprabhat956@gmail.com
Suite Teardown      Close Application

*** Test Cases ***
Bookmark And Apply To Recommended Job
    [Documentation]    Refresh after login, bookmark and apply to a recommended job, then browse All Jobs, My Jobs, and LinkedIn Job Post.
    [Tags]    regression    jobs    recommended
    Set Selenium Speed    2s
    Reload Page
    Grant Location Permission
    Sleep    10s
    Open Recommended Jobs
    Bookmark Recommended Job
    ${jobs_window}=    Open External Job Application
    Return To Jobs Tab    ${jobs_window}
    Open All Jobs My Jobs And LinkedIn Job Post
    Bookmark Recommended Job
    ${jobs_window}=    Open LinkedIn Job Post
    Return To Jobs Tab    ${jobs_window}
