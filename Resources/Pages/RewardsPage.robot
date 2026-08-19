*** Settings ***
Documentation    Navigation keywords for the Rewards module.

Library          SeleniumLibrary

Resource         ../Variables/Config.robot
Resource         ../Variables/TestData.robot


*** Variables ***

${REWARDS_TAB}                       xpath=//div[contains(@class,'text-xs') and normalize-space()='Rewards']
${PRODUCT_SEARCH_INPUT}              xpath=//input[@placeholder='Search products...']
${ALL_CATEGORIES_BUTTON}             xpath=//button[normalize-space()='All Categories']
${CATEGORY_BUTTONS}                  xpath=//button[normalize-space()='All Categories']/parent::div/button[not(normalize-space()='All Categories')]
${FIRST_BUY_NOW_BUTTON}              xpath=(//button[translate(normalize-space(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='BUY NOW'])[1]
${PRODUCT_DETAILS_BUY_NOW_BUTTON}    xpath=//button[translate(normalize-space(), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')='BUY NOW']

${ADD_DELIVERY_ADDRESS_BUTTON}       xpath=//button[contains(normalize-space(), 'Add new delivery address')]
${ADD_DELIVERY_ADDRESS_TITLE}        xpath=//*[normalize-space()='Add Delivery Address']

${DELIVERY_PINCODE_INPUT}            xpath=//input[@name='pincode']
${DELIVERY_ADDRESS_INPUT}            xpath=//input[@placeholder='Enter address']
${DELIVERY_AREA_INPUT}               xpath=//input[@placeholder='Area / street']
${DELIVERY_GST_NUMBER_INPUT}         xpath=//input[contains(@placeholder, 'AAAAA0000A1Z5')]

${DELIVERY_STATE_SELECT}             xpath=//*[self::label or self::p][normalize-space()='State']/following::select[1]
${DELIVERY_CITY_SELECT}              xpath=//*[self::label or self::p][normalize-space()='City']/following::select[1]

${USE_THIS_ADDRESS_BUTTON}           xpath=//button[@type='submit' and normalize-space()='Use This Address']
${DELIVERY_ADDRESS_CHECKBOX}         xpath=(//input[@type='checkbox' and @readonly])[1]

${BILLING_ADDRESS_TAB}               xpath=//*[self::button or @role='tab'][normalize-space()='Billing Address']
${SAME_AS_DELIVERY_BUTTON}           xpath=//button[normalize-space()='Same as delivery']

${COMPLETE_SECURE_PURCHASE_BUTTON}   xpath=//button[normalize-space()='Complete Secure Purchase']

${RAZORPAY_PAYMENT_FRAME}            css:iframe.razorpay-checkout-frame
${PAYMENT_WALLET_OPTION}             css:span[data-testid="Wallet"]
${AMAZON_PAY_OPTION}                 xpath=//span[normalize-space()='Amazon Pay']
${MOCK_PAYMENT_SUCCESS_BUTTON}       xpath=//button[normalize-space()='Success']


*** Keywords ***

Open Rewards Module
    Wait Until Element Is Visible    ${REWARDS_TAB}    ${TIMEOUT}
    Scroll Element Into View         ${REWARDS_TAB}
    Click Element                    ${REWARDS_TAB}
    Wait Until Element Is Visible    ${PRODUCT_SEARCH_INPUT}    ${TIMEOUT}


Browse All Reward Categories
    Open All Reward Categories
    Sleep    2s

    @{category_buttons}=    Get WebElements    ${CATEGORY_BUTTONS}

    FOR    ${category_button}    IN    @{category_buttons}
        ${category_name}=    Get Text    ${category_button}
        Open Reward Category    ${category_name}
        Sleep    2s
    END


Open All Reward Categories
    Wait Until Element Is Visible    ${ALL_CATEGORIES_BUTTON}    ${TIMEOUT}
    Click Element                    ${ALL_CATEGORIES_BUTTON}


Open Reward Category
    [Arguments]    ${category_name}

    ${category_locator}=    Set Variable    xpath=//button[normalize-space()="${category_name}"]

    Wait Until Element Is Visible    ${category_locator}    ${TIMEOUT}
    Scroll Element Into View         ${category_locator}
    Click Element                    ${category_locator}


Click Product Search
    Wait Until Element Is Visible    ${PRODUCT_SEARCH_INPUT}    ${TIMEOUT}
    Click Element                    ${PRODUCT_SEARCH_INPUT}


Search Reward Products
    [Arguments]    ${search_term}

    Click Product Search
    Clear Element Text               ${PRODUCT_SEARCH_INPUT}
    Input Text                       ${PRODUCT_SEARCH_INPUT}    ${search_term}


Click First Buy Now
    Wait Until Element Is Visible    ${FIRST_BUY_NOW_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${FIRST_BUY_NOW_BUTTON}
    Click Element                    ${FIRST_BUY_NOW_BUTTON}


Open Checkout From Search Result
    Click First Buy Now
    Wait Until Element Is Visible    ${PRODUCT_DETAILS_BUY_NOW_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${PRODUCT_DETAILS_BUY_NOW_BUTTON}
    Click Element                    ${PRODUCT_DETAILS_BUY_NOW_BUTTON}
    Wait Until Element Is Visible    ${ADD_DELIVERY_ADDRESS_BUTTON}    ${TIMEOUT}


Click Add New Delivery Address
    Wait Until Element Is Visible    ${ADD_DELIVERY_ADDRESS_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${ADD_DELIVERY_ADDRESS_BUTTON}
    Click Element                    ${ADD_DELIVERY_ADDRESS_BUTTON}


Fill Delivery Address
    Wait Until Element Is Visible    ${ADD_DELIVERY_ADDRESS_TITLE}    ${TIMEOUT}

    Input Text    ${DELIVERY_PINCODE_INPUT}        ${DELIVERY_PINCODE}
    Input Text    ${DELIVERY_ADDRESS_INPUT}       ${DELIVERY_ADDRESS_LINE}
    Input Text    ${DELIVERY_AREA_INPUT}          ${DELIVERY_AREA}

    Select From List By Label    ${DELIVERY_STATE_SELECT}    ${DELIVERY_STATE}
    Select From List By Label    ${DELIVERY_CITY_SELECT}     ${DELIVERY_CITY}

    Input Text    ${DELIVERY_GST_NUMBER_INPUT}    ${DELIVERY_GST_NUMBER}


Use This Delivery Address
    Wait Until Element Is Visible    ${USE_THIS_ADDRESS_BUTTON}    ${TIMEOUT}
    Click Element                    ${USE_THIS_ADDRESS_BUTTON}


Select Delivery Address Checkbox
    Wait Until Element Is Visible    ${DELIVERY_ADDRESS_CHECKBOX}    ${TIMEOUT}
    Click Element                    ${DELIVERY_ADDRESS_CHECKBOX}


Open Billing Address
    Wait Until Element Is Visible    ${BILLING_ADDRESS_TAB}    ${TIMEOUT}
    Click Element                    ${BILLING_ADDRESS_TAB}


Select Same As Delivery Address
    Wait Until Element Is Visible    ${SAME_AS_DELIVERY_BUTTON}    ${TIMEOUT}
    Click Element                    ${SAME_AS_DELIVERY_BUTTON}


Click Complete Secure Purchase
    Wait Until Element Is Visible    ${COMPLETE_SECURE_PURCHASE_BUTTON}    ${TIMEOUT}
    Scroll Element Into View         ${COMPLETE_SECURE_PURCHASE_BUTTON}
    Click Element                    ${COMPLETE_SECURE_PURCHASE_BUTTON}


Verify Payment Options Are Open
    Wait Until Element Is Visible    ${RAZORPAY_PAYMENT_FRAME}    ${TIMEOUT}

    Select Frame    ${RAZORPAY_PAYMENT_FRAME}

    Wait Until Page Contains    Payment Options    ${TIMEOUT}

    Unselect Frame


Select Wallet Payment Option
    Wait Until Element Is Visible    ${RAZORPAY_PAYMENT_FRAME}    ${TIMEOUT}

    Select Frame    ${RAZORPAY_PAYMENT_FRAME}

    Wait Until Element Is Visible    ${PAYMENT_WALLET_OPTION}    ${TIMEOUT}
    Click Element    ${PAYMENT_WALLET_OPTION}

    Unselect Frame


Select Amazon Pay Wallet
    Wait Until Element Is Visible    ${RAZORPAY_PAYMENT_FRAME}    ${TIMEOUT}

    Select Frame    ${RAZORPAY_PAYMENT_FRAME}

    Wait Until Element Is Visible    ${AMAZON_PAY_OPTION}    ${TIMEOUT}
    Click Element    ${AMAZON_PAY_OPTION}

    Unselect Frame


Complete Mock Payment Successfully
    Wait Until Keyword Succeeds    ${TIMEOUT}    1s    Switch Window    NEW
    Wait Until Element Is Visible    ${MOCK_PAYMENT_SUCCESS_BUTTON}    ${TIMEOUT}
    Click Element                    ${MOCK_PAYMENT_SUCCESS_BUTTON}
