*** Settings ***
Documentation       Network-module navigation test suite.
Resource            ../Resources/Pages/LoginPage.robot
Resource            ../Resources/Pages/NetworkPage.robot

Suite Setup         Run Keywords    Open Application    AND    Login To Application    email=kprabhat956@gmail.com
Suite Teardown      Close Application

*** Test Cases ***
Open Network Module After Login
    [Documentation]    Logs in, then waits 10 seconds between refresh, Network, Connect, and All Connections actions.
    [Tags]    regression    network
    Reload Page
    Sleep    10s
    Open Network Module
    Sleep    10s
    Connect With First Two Users
    Open All Connections
    Sleep    10s
    Remove First Connection
    Open Pending Requests
    Sleep    10s
    Open Sent Requests
    Sleep    10s
    Cancel First Two Sent Requests
