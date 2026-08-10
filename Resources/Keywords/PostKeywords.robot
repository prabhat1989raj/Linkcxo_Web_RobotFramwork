*** Settings ***
Library    SeleniumLibrary

Resource    ../Variables/Config.robot
Resource    ../Variables/TestData.robot
Resource    ../Variables/Locators.robot
Resource    ../Pages/PostPage.robot


*** Keywords ***

Create New Post
    Capture Page Screenshot

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s
    Click Element    ${POST_BUTTON_HOME}

    Wait Until Element Is Visible    ${POST_OPTION}    ${TIMEOUT}
    Click Element    ${POST_OPTION}

    Wait Until Element Is Visible    ${POST_TEXTBOX}    30s
    Input Text    ${POST_TEXTBOX}    ${POST_CONTENT}

    Choose File    ${IMAGE_UPLOAD}    ${POST_IMAGE}

    Sleep    5s

    Capture Page Screenshot

    Wait Until Element Is Visible    ${SUBMIT_POST}    ${TIMEOUT}
    Click Element    ${SUBMIT_POST}

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s

    Capture Page Screenshot


Create Post With Document
    Capture Page Screenshot

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s
    Click Element    ${POST_BUTTON_HOME}

    Wait Until Element Is Visible    ${POST_OPTION}    ${TIMEOUT}
    Click Element    ${POST_OPTION}

    Wait Until Element Is Visible    ${POST_TEXTBOX}    30s
    Input Text    ${POST_TEXTBOX}    ${POST_CONTENT}

    Choose File    ${DOCUMENT_UPLOAD}    ${POST_DOCUMENT}

    # Wait for document upload to complete
    Sleep    15s

    Capture Page Screenshot

    Wait Until Element Is Visible    ${SUBMIT_POST}    ${TIMEOUT}
    Click Element    ${SUBMIT_POST}

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s

    Capture Page Screenshot


Create Post With Video
    Capture Page Screenshot

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s
    Click Element    ${POST_BUTTON_HOME}

    Wait Until Element Is Visible    ${POST_OPTION}    ${TIMEOUT}
    Click Element    ${POST_OPTION}

    Wait Until Element Is Visible    ${POST_TEXTBOX}    30s
    Input Text    ${POST_TEXTBOX}    ${POST_CONTENT}

    Choose File    ${VIDEO_UPLOAD}    ${POST_VIDEO}

    # Wait for video upload to complete
    Sleep    15s

    Capture Page Screenshot

    Wait Until Element Is Visible    ${SUBMIT_POST}    ${TIMEOUT}
    Click Element    ${SUBMIT_POST}

    Wait Until Element Is Visible    ${POST_BUTTON_HOME}    30s

    Capture Page Screenshot