*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Event
    [Arguments]    ${event_type}=${EVENT_TYPE_PUBLIC}    ${event_title}=${EVENT_TITLE_PUBLIC}    ${skip_navigation}=${FALSE}
    [Documentation]    Creates an event by filling image, title, type,
    ...                industry, category, description, host details,
    ...                registration link, address, date/time, confirms
    ...                creation, and verifies it appears under My events

    IF    not ${skip_navigation}
        Wait Until Element Is Visible    ${HAMBURGER_MENU}    ${TIMEOUT}
        Execute Javascript    var el = document.evaluate("//div[@class='cursor-pointer hover:scale-110 ']//*[name()='svg']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; var evt = new MouseEvent('click', {bubbles: true, cancelable: true, view: window}); el.dispatchEvent(evt);
        Sleep    2s

        Wait Until Page Contains Element    ${EVENTS_MENU}    30s
        Scroll Element Into View            ${EVENTS_MENU}
        Wait Until Element Is Visible       ${EVENTS_MENU}    30s
        Click Element                       ${EVENTS_MENU}
    END

    Wait Until Element Is Visible    ${CREATE_EVENT_BUTTON}    ${TIMEOUT}
    Click Element                    ${CREATE_EVENT_BUTTON}

    Choose File                      ${EVENT_IMAGE_UPLOAD}    ${EVENT_IMAGE}

    Wait Until Element Is Visible    ${EVENT_TITLE_INPUT}    ${TIMEOUT}
    Input Text                       ${EVENT_TITLE_INPUT}    ${event_title}

    Wait Until Element Is Visible    ${event_type}    ${TIMEOUT}
    Click Element                    ${event_type}

    Wait Until Element Is Visible    ${EVENT_INDUSTRY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${EVENT_INDUSTRY_DROPDOWN}
    Wait Until Element Is Visible    ${EVENT_INDUSTRY_OPTION}    ${TIMEOUT}
    Click Element                    ${EVENT_INDUSTRY_OPTION}

    Wait Until Element Is Visible    ${EVENT_CATEGORY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${EVENT_CATEGORY_DROPDOWN}
    Wait Until Element Is Visible    ${EVENT_CATEGORY_OPTION}    ${TIMEOUT}
    Click Element                    ${EVENT_CATEGORY_OPTION}

    Wait Until Element Is Visible    ${EVENT_DESCRIPTION}    ${TIMEOUT}
    Input Text                       ${EVENT_DESCRIPTION}    ${EVENT_DESCRIPTION_TEXT}

    Wait Until Element Is Visible    ${EVENT_HOST_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${EVENT_HOST_DROPDOWN}
    Wait Until Element Is Visible    ${EVENT_HOST_OPTION}    ${TIMEOUT}
    Click Element                    ${EVENT_HOST_OPTION}

    Wait Until Element Is Visible    ${EVENT_REGISTRATION_LINK}    ${TIMEOUT}
    Input Text                       ${EVENT_REGISTRATION_LINK}    ${EVENT_REGISTRATION_LINK_VALUE}

    Wait Until Element Is Visible    ${EVENT_ADDRESS_INPUT}    ${TIMEOUT}
    Input Text                       ${EVENT_ADDRESS_INPUT}    ${EVENT_ADDRESS}

    Wait Until Element Is Visible    ${EVENT_START_DATE}    ${TIMEOUT}
    Click Element                    ${EVENT_START_DATE}
    Press Keys                       ${EVENT_START_DATE}    08/28/2026

    Wait Until Element Is Visible    ${EVENT_START_TIME}    ${TIMEOUT}
    Click Element                    ${EVENT_START_TIME}
    Press Keys                       ${EVENT_START_TIME}    09:00AM

    Wait Until Element Is Visible    ${EVENT_END_DATE}    ${TIMEOUT}
    Click Element                    ${EVENT_END_DATE}
    Press Keys                       ${EVENT_END_DATE}    08/28/2026

    Wait Until Element Is Visible    ${EVENT_END_TIME}    ${TIMEOUT}
    Click Element                    ${EVENT_END_TIME}
    Press Keys                       ${EVENT_END_TIME}    11:00AM

    Wait Until Element Is Visible    ${EVENT_HOST_EMAIL_INPUT}    ${TIMEOUT}
    Input Text                       ${EVENT_HOST_EMAIL_INPUT}    ${EVENT_HOST_EMAIL}

    Wait Until Element Is Visible    ${EVENT_NEXT_BUTTON}    ${TIMEOUT}
    Click Element                    ${EVENT_NEXT_BUTTON}

    Wait Until Element Is Visible    ${EVENT_CREATE_BUTTON}    ${TIMEOUT}
    Click Element                    ${EVENT_CREATE_BUTTON}

    Sleep    5s

    Capture Page Screenshot

    Wait Until Element Is Visible    ${MY_EVENTS_TAB}    ${TIMEOUT}
    Execute Javascript    document.evaluate("//*[normalize-space()='My events']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    Wait Until Page Contains    ${event_title}    ${TIMEOUT}

    Capture Page Screenshot