*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Club
    [Arguments]    ${club_type}=${CLUB_TYPE_PUBLIC}
    [Documentation]    Creates a club by uploading an image, entering name,
    ...                selecting type (Public/Private), industry and category,
    ...                entering description, then confirming creation

    Wait Until Element Is Visible    ${HAMBURGER_MENU}    ${TIMEOUT}
    Execute Javascript    var el = document.evaluate("//div[@class='cursor-pointer hover:scale-110 ']//*[name()='svg']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; var evt = new MouseEvent('click', {bubbles: true, cancelable: true, view: window}); el.dispatchEvent(evt);
    Sleep    2s

    Wait Until Element Is Visible    ${CLUB_MENU}    ${TIMEOUT}
    Execute Javascript    document.evaluate("//h2[normalize-space()='Clubs']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    Sleep    2s

    Wait Until Element Is Visible    ${CREATE_CLUB_BUTTON}    ${TIMEOUT}
    Execute Javascript    document.evaluate("//button[normalize-space()='Create Club']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    Choose File                      ${CLUB_IMAGE_UPLOAD}    ${CLUB_IMAGE}

    Wait Until Element Is Visible    ${CLUB_NAME_INPUT}    ${TIMEOUT}
    Input Text                       ${CLUB_NAME_INPUT}    ${CLUB_NAME}

    Wait Until Element Is Visible    ${club_type}    ${TIMEOUT}
    Click Element                    ${club_type}

    Wait Until Element Is Visible    ${CLUB_INDUSTRY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${CLUB_INDUSTRY_DROPDOWN}
    Wait Until Element Is Visible    ${CLUB_INDUSTRY_OPTION}    ${TIMEOUT}
    Click Element                    ${CLUB_INDUSTRY_OPTION}

    Wait Until Element Is Visible    ${CLUB_CATEGORY_DROPDOWN}    ${TIMEOUT}
    Click Element                    ${CLUB_CATEGORY_DROPDOWN}
    Wait Until Element Is Visible    ${CLUB_CATEGORY_OPTION}    ${TIMEOUT}
    Click Element                    ${CLUB_CATEGORY_OPTION}

    Wait Until Element Is Visible    ${CLUB_DESCRIPTION_INPUT}    ${TIMEOUT}
    Input Text                       ${CLUB_DESCRIPTION_INPUT}    ${CLUB_DESCRIPTION}

    Wait Until Element Is Visible    ${NEXT_BUTTON}    ${TIMEOUT}
    Click Element                    ${NEXT_BUTTON}

    Sleep    2s
    Wait Until Element Is Visible    ${CREATE_BUTTON}    30s
    Execute Javascript    document.evaluate("//button[normalize-space()='Create'][1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    Sleep    5s

    Capture Page Screenshot