*** Settings ***
Library    SeleniumLibrary

*** Variables ***

# Home Page
${POST_BUTTON_HOME}          xpath=//button[normalize-space()='Post']

# Compose Article
${ARTICLE_OPTION}            xpath=//h1[normalize-space()='Compose an article']

# Upload Image
${ARTICLE_IMAGE_UPLOAD}      xpath=(//input[@type='file'])[1]

# Title
${ARTICLE_TITLE}             xpath=//input[@placeholder='Enter article title']

# Description (Quill Editor)
${ARTICLE_DESCRIPTION}       xpath=//div[contains(@class,'ql-editor')]

# Publish Button
${PUBLISH_BUTTON}            xpath=//button[normalize-space()='Publish']


*** Keywords ***
Create New Article

    Capture Page Screenshot

    # Wait for page to load
    Wait Until Page Contains Element    ${POST_BUTTON_HOME}    timeout=30s

    # Click Post button
    Wait Until Element Is Visible       ${POST_BUTTON_HOME}    timeout=30s
    Wait Until Element Is Enabled       ${POST_BUTTON_HOME}    timeout=30s
    Scroll Element Into View            ${POST_BUTTON_HOME}
    Click Element                       ${POST_BUTTON_HOME}

    Sleep    2s

    # Click Compose an article
    Wait Until Element Is Visible       ${ARTICLE_OPTION}    timeout=30s
    Scroll Element Into View            ${ARTICLE_OPTION}
    Sleep    2s

    # JavaScript click (avoids ElementClickInterceptedException)
    Execute JavaScript
    ...    document.evaluate("//h1[normalize-space()='Compose an article']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();

    # Wait until article page opens
    Wait Until Element Is Visible       ${ARTICLE_TITLE}    timeout=30s

    Capture Page Screenshot

    # Upload Image
    Choose File                         ${ARTICLE_IMAGE_UPLOAD}    D:/images3.jpg

    Sleep    3s

    # Enter Title
    Clear Element Text                  ${ARTICLE_TITLE}
    Input Text                          ${ARTICLE_TITLE}    Testing Article

    # Enter Description
    Wait Until Element Is Visible       ${ARTICLE_DESCRIPTION}    timeout=30s
    Click Element                       ${ARTICLE_DESCRIPTION}
    Input Text                          ${ARTICLE_DESCRIPTION}
    ...    This is a testing article created using Robot Framework automation.

    Sleep    2s

    Capture Page Screenshot

    # Publish Article
    Wait Until Element Is Visible       ${PUBLISH_BUTTON}    timeout=30s
    Wait Until Element Is Enabled       ${PUBLISH_BUTTON}    timeout=30s
    Scroll Element Into View            ${PUBLISH_BUTTON}
    Click Element                       ${PUBLISH_BUTTON}

    Sleep    5s

    Capture Page Screenshot