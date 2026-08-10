*** Settings ***
Resource    ../Resources/Pages/LoginPage.robot
Resource    ../Resources/Pages/EventPage.robot

Suite Setup       Open Application
Suite Teardown    Close Application


*** Test Cases ***
Create Public And Private Event Successfully
    Login To Application
    Create New Event    ${EVENT_TYPE_PUBLIC}    ${EVENT_TITLE_PUBLIC}

    Sleep    15s

    Execute Javascript    window.scrollTo(0, 0);
    Sleep    2s

    Create New Event    ${EVENT_TYPE_PRIVATE}    ${EVENT_TITLE_PRIVATE}    ${TRUE}