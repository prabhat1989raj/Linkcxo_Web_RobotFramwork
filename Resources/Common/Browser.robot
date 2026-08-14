*** Settings ***
Library     SeleniumLibrary
Resource    ../Variables/Config.robot

*** Keywords ***
Open Application
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{location_rule}=    Create Dictionary    setting    1
    &{location_exceptions}=    Create Dictionary    https://dev.cxostory.in,*    ${location_rule}
    &{preferences}=    Create Dictionary
    ...    profile.default_content_setting_values.geolocation    1
    ...    profile.content_settings.exceptions.geolocation    ${location_exceptions}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${preferences}
    Open Browser    ${URL}    ${BROWSER}    options=${chrome_options}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}

Close Application
    Capture Page Screenshot
    Close Browser
