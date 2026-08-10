*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Club
    [Documentation]    Creates a club by uploading an image, entering name,
    ...                selecting industry and category, entering description,
    ...                then confirming creation

    Wait Until Element Is Visible    ${HAMBURGER_MENU}    ${TIMEOUT}
    Click Element                    ${HAMBURGER_MENU}

    Wait Until Element Is Visible    ${CLUB_MENU}    ${TIMEOUT}
    Click Element                    ${CLUB_MENU}

    Wait Until Element Is Visible    ${CREATE_CLUB_BUTTON}    ${TIMEOUT}
    Click Element                    ${CREATE_CLUB_BUTTON}

    Choose File                      ${CLUB_IMAGE_UPLOAD}    ${CLUB_IMAGE}

    Wait Until Element Is Visible    ${CLUB_NAME_INPUT}    ${TIMEOUT}
    Input Text                       ${CLUB_NAME_INPUT}    ${CLUB_NAME}

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

    Wait Until Element Is Visible    ${CREATE_BUTTON}    ${TIMEOUT}
    Click Element                    ${CREATE_BUTTON}

    Sleep    5s

    Capture Page Screenshot