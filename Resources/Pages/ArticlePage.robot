*** Settings ***
Library    SeleniumLibrary
Resource   ../Variables/Config.robot
Resource   ../Variables/TestData.robot
Resource   ../Variables/Locators.robot

*** Keywords ***

Create New Article
    [Documentation]    Creates an article with an image, title, and content, then publishes it.
    ...                No separate Save step — Publish alone completes the action
    ...                in the current UI (confirmed via real button HTML).

    Wait Until Element Is Visible    ${POST_BUTTON}    ${TIMEOUT}
    Wait Until Element Is Enabled    ${POST_BUTTON}    ${TIMEOUT}
    Sleep    3s
    Click Element                    ${POST_BUTTON}

    Wait Until Element Is Visible    ${CREATE_ARTICLE_OPTION}    ${TIMEOUT}
    Sleep    3s
    Click Element                    ${CREATE_ARTICLE_OPTION}

    Wait Until Page Contains Element    ${ARTICLE_UPLOAD_IMAGE}    ${TIMEOUT}
    Sleep    3s
    Choose File                         ${ARTICLE_UPLOAD_IMAGE}    ${SAMPLE_FILE_PATH}

    Wait Until Element Is Visible    ${ARTICLE_TITLE}    ${TIMEOUT}
    Sleep    3s
    Clear Element Text               ${ARTICLE_TITLE}
    Input Text                       ${ARTICLE_TITLE}    ${ARTICLE_TITLE_TEXT}

    Wait Until Element Is Visible    ${ARTICLE_CONTENT}    ${TIMEOUT}
    Sleep    3s
    Clear Element Text               ${ARTICLE_CONTENT}
    Input Text                       ${ARTICLE_CONTENT}    ${ARTICLE_CONTENT_TEXT}

    Wait Until Element Is Enabled    ${ARTICLE_PUBLISH_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${ARTICLE_PUBLISH_BUTTON}
    Click Element                    ${ARTICLE_PUBLISH_BUTTON}

    # NOTE: still an unverified guess — if this line fails, Publish likely
    # worked but this success indicator doesn't exist on the page.
    Sleep    3s
    Wait Until Element Is Visible    ${ARTICLE_SUCCESS_MESSAGE}    ${TIMEOUT}
