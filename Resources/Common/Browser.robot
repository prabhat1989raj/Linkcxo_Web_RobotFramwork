*** Settings ***
Library     SeleniumLibrary
Resource    ../Variables/Config.robot

*** Keywords ***
Open Application
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    &{location_rule}=    Create Dictionary    setting    1
    &{location_exceptions}=    Create Dictionary    https://dev.cxostory.in:443,*    ${location_rule}
    &{preferences}=    Create Dictionary
    ...    profile.default_content_setting_values.geolocation    1
    ...    profile.managed_default_content_settings.geolocation    1
    ...    profile.content_settings.exceptions.geolocation    ${location_exceptions}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${preferences}
    Open Browser    ${URL}    ${BROWSER}    options=${chrome_options}
    Grant Location Permission
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Set Selenium Speed    ${ACTION_DELAY}

Close Application
    Capture Page Screenshot
    Close Browser

Grant Location Permission
    [Documentation]    Grants Chrome geolocation permission for the configured application URL.
    ${driver}=    Evaluate    robot.libraries.BuiltIn.BuiltIn().get_library_instance('SeleniumLibrary').driver    modules=robot.libraries.BuiltIn
    @{permissions}=    Create List    geolocation
    &{parameters}=    Create Dictionary    permissions    ${permissions}    origin    ${URL}
    Call Method    ${driver}    execute_cdp_cmd    Browser.grantPermissions    ${parameters}
