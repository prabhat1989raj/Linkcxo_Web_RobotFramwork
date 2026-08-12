*** Variables ***

# ============================================================
# LOGIN PAGE LOCATORS
# ============================================================

${LOGIN_BUTTON}             xpath=//button[normalize-space()='Login']
${EMAIL_INPUT}              xpath=//input[@id='emailId']
${CONTINUE_BUTTON}          xpath=//button[contains(normalize-space(),'Continue')]

# OTP Fields
${OTP_INPUT_1}              xpath=//input[@name='otp-input-0']
${OTP_INPUT_2}              xpath=//input[@name='otp-input-1']
${OTP_INPUT_3}              xpath=//input[@name='otp-input-2']
${OTP_INPUT_4}              xpath=//input[@name='otp-input-3']
${OTP_INPUT_5}              xpath=//input[@name='otp-input-4']
${OTP_INPUT_6}              xpath=//input[@name='otp-input-5']

${VERIFY_BUTTON_XPATH}       //button[contains(@class,'mb-8') and contains(normalize-space(),'Continue')]

${HOME_PAGE}                xpath=//body


# ============================================================
# POST PAGE
# ============================================================

${POST_BUTTON_HOME}         xpath=//button[normalize-space()='Post']
${POST_OPTION}              xpath=//h1[normalize-space()='Create a post']
${POST_TEXTBOX}             xpath=//textarea[@rows='10']

${IMAGE_UPLOAD}             xpath=(//input[@type='file'])[1]
${DOCUMENT_UPLOAD}          xpath=//input[@name='attachment' and @type='file']
${VIDEO_UPLOAD}             xpath=//input[@name='video' and @type='file']

${SUBMIT_POST}              xpath=//button[normalize-space()='Post']


# ============================================================
# SURVEY PAGE
# ============================================================

${POST_BUTTON}              xpath=//button[normalize-space()='Post']
${SURVEY_OPTION}            xpath=//h1[contains(normalize-space(),'Create a survey')]

${SURVEY_TITLE_INPUT}       xpath=(//input[@id='title'])[1]
${SURVEY_DESCRIPTION_INPUT}  xpath=(//textarea[@id='description'])[1]

${CATEGORY_DROPDOWN}        xpath=//label[contains(.,'Category')]/following::div[contains(@class,'control')][1]
${CATEGORY_OPTION}          xpath=//div[@role='option' and normalize-space()='Business Growth']

${QUESTION1_INPUT}          xpath=//input[@id='questions.question-0']

${QUESTION_TYPE1_DROPDOWN}  xpath=(//div[contains(@class,'control')])[2]
${MULTIPLE_CHOICE_OPTION}   xpath=//div[@role='option' and normalize-space()='Multiple Choice']

${OPTION1_INPUT}            xpath=//input[@name='questions.0.options.0.option']
${OPTION2_INPUT}            xpath=//input[@name='questions.0.options.1.option']
${ADD_OPTION_BUTTON}        xpath=//button[.//span[text()='+'] and contains(.,'Add Option')]
${OPTION3_INPUT}            xpath=//input[@name='questions.0.options.2.option']

${QUESTION2_INPUT}          xpath=//input[@id='questions.question-1']

${QUESTION_TYPE2_DROPDOWN}  xpath=//input[@id='questions.question-1']/ancestor::div[contains(@class,'space-y')][1]//div[contains(@class,'control')]
${SELECT_OPTION_TYPE}       xpath=//div[@role='option'][normalize-space()='Select Option']

${QUESTION2_OPTION1_INPUT}  xpath=//input[@name='questions.1.options.0.option']
${QUESTION2_OPTION2_INPUT}  xpath=//input[@name='questions.1.options.1.option']

${SURVEY_DURATION_DROPDOWN}  xpath=//label[normalize-space()='Survey Duration']/following::div[contains(@class,'control')][1]
${ONE_WEEK_OPTION}          xpath=//div[@role='option' and normalize-space()='In 1 Week']

${CREATE_SURVEY_BUTTON}     xpath=//button[@type='submit' and normalize-space()='Create Survey']


# ============================================================
# POLL PAGE
# ============================================================

${CREATE_POLL_OPTION}       xpath=//h1[contains(normalize-space(),'Create a poll')]
${POLL_QUESTION}            xpath=(//textarea[@id='question'])[1]

${FIRST_CATEGORY_OPTION}    xpath=//div[@role='option'][1]

${OPTION_1}                 xpath=//input[@placeholder='Option 1']
${OPTION_2}                 xpath=//input[@placeholder='Option 2']
${OPTION_3}                 xpath=//input[@placeholder='Option 3']
${OPTION_4}                 xpath=//input[@placeholder='Option 4']

${POLL_ADD_OPTION_BUTTON}   xpath=//button[contains(.,'Add Option')]

${SAVE_POLL_BUTTON}         xpath=//button[normalize-space()='Save']

${POLL_SUCCESS_MESSAGE}     xpath=//*[contains(text(),'success') or contains(text(),'Poll created')]


# ============================================================
# ARTICLE PAGE
# ============================================================

${CREATE_ARTICLE_OPTION}       xpath=//h1[normalize-space()='Compose an article']
${ARTICLE_UPLOAD_IMAGE}        xpath=(//input[@type='file'])[1]
${ARTICLE_TITLE}               xpath=//input[@placeholder='Enter article title']
${ARTICLE_CONTENT}             xpath=//div[contains(@class,'ql-editor')]
${ARTICLE_PUBLISH_BUTTON}      xpath=//button[normalize-space()='Publish']
${ARTICLE_PUBLISH_BUTTON_XPATH}    //button[normalize-space()='Publish']
${ARTICLE_SUCCESS_MESSAGE}     xpath=//*[contains(text(),'success') or contains(text(),'Article created')]


# ============================================================
# QUERY PAGE
# ============================================================

${CREATE_QUERY_OPTION}       xpath=//h1[contains(normalize-space(),'Post as a query')]
${QUERY_CATEGORY_DROPDOWN}  xpath=//label[contains(text(),'Categ')]/following::div[1]
${QUERY_CATEGORY_OPTION}    xpath=//div[@role='option'][1]
${QUERY_QUESTIONS}          xpath=//input[@placeholder='Enter Questions']
${QUERY_DESCRIPTION}        xpath=//textarea[@placeholder='Add a brief description']
${QUERY_SAVE_BUTTON}        xpath=//button[normalize-space()='Save Query']
${QUERY_SUCCESS_MESSAGE}    xpath=//*[contains(text(),'success') or contains(text(),'Query created')]


# ============================================================
# CLUB PAGE
# ============================================================

${HAMBURGER_MENU}           xpath=//div[@class='cursor-pointer hover\:scale-110 ']//*[name()='svg']
${CLUB_MENU}                xpath=//h2[normalize-space()='Clubs']
${CREATE_CLUB_BUTTON}       xpath=//button[normalize-space()='Create Club']
${CLUB_IMAGE_UPLOAD}        xpath=//input[@type='file' and @accept='.jpg,.jpeg,.png']
${CLUB_NAME_INPUT}          xpath=(//input[@placeholder='Enter Title'])[1]
${CLUB_DESCRIPTION_INPUT}   xpath=(//textarea[@placeholder='Enter Here'])[1]
${NEXT_BUTTON}              xpath=(//button[normalize-space()='Next'])[1]
${CREATE_BUTTON}             xpath=(//button[normalize-space()='Create'])[1]

${CLUB_INDUSTRY_DROPDOWN}   xpath=//label[contains(text(),'Industry')]/following::div[1]
${CLUB_INDUSTRY_OPTION}     xpath=(//div[@role='option'])[1]

${CLUB_CATEGORY_DROPDOWN}   xpath=//label[contains(text(),'Category')]/following::div[1]
${CLUB_CATEGORY_OPTION}     xpath=(//div[@role='option'])[2]

${CLUB_TYPE_PUBLIC}         xpath=//input[@name='isPrivate' and @value='false']
${CLUB_TYPE_PRIVATE}        xpath=//input[@name='isPrivate' and @value='true']


# ============================================================
# EVENT PAGE
# ============================================================

${EVENTS_MENU}              xpath=//h2[contains(text(),'Events')]
${CREATE_EVENT_BUTTON}      xpath=//button[normalize-space()='Create Event']
${EVENT_IMAGE_UPLOAD}       xpath=//input[@type='file']
${EVENT_TITLE_INPUT}        xpath=(//input[@placeholder='Enter Title'])[1]

${EVENT_TYPE_PUBLIC}        xpath=(//input[@name='isPrivate'])[1]
${EVENT_TYPE_PRIVATE}       xpath=(//input[@name='isPrivate'])[2]

${EVENT_INDUSTRY_DROPDOWN}  xpath=//label[.='Industry']/following::div[1]
${EVENT_INDUSTRY_OPTION}    xpath=//div[text()='Professional Services']

${EVENT_CATEGORY_DROPDOWN}  xpath=//label[.='Category']/following::div[1]
${EVENT_CATEGORY_OPTION}    xpath=//div[text()='Business Growth']

${EVENT_DESCRIPTION}        xpath=//textarea[contains(@placeholder,'Enter Here')]
${EVENT_HOST_DROPDOWN}      xpath=//label[text()='Host \*']/following::div[1]
${EVENT_HOST_OPTION}        xpath=//option[@value='Individual']

${EVENT_REGISTRATION_LINK}  xpath=//input[@placeholder='Registration Link']
${EVENT_ADDRESS_INPUT}      xpath=(//input[@placeholder='Enter Address'])[1]

${EVENT_START_DATE}         xpath=(//input[@placeholder='Select Date'])[1]
${EVENT_END_DATE}           xpath=(//input[@placeholder='Select Date'])[2]
${EVENT_DATE_28}            xpath=//div[contains(@class,'react-datepicker__day--028')]

${EVENT_START_TIME}         xpath=//input[@name='startTime']
${EVENT_END_TIME}           xpath=//input[@name='endTime']
${EVENT_HOST_EMAIL_INPUT}   xpath=//input[@placeholder='support\@gmail.com']

${EVENT_NEXT_BUTTON}        xpath=//button[normalize-space()='Next']
${EVENT_CREATE_BUTTON}      xpath=//button[normalize-space()='Create']
${MY_EVENTS_TAB}            xpath=//*[normalize-space()='My events']


# ============================================================
# PROFILE PAGE - UPDATE PROFILE
# ============================================================

# Profile Header
${USER_PROFILE_ICON}        xpath=//img[contains(@class,'dark\:border-lxblack-100')]
${USER_PROFILE_LINK}        xpath=//a[@href='/tab/profile']


# ============================================================
# PROFILE PAGE - UPDATE PROFILE
# ============================================================

# ------------------------------------------------------------
# Profile Image & Banner
# ------------------------------------------------------------

${PROFILE_IMAGE_INPUT}              xpath=//input[@type='file' and @name='profilePicture']
${PROFILE_BANNER_IMAGE_INPUT}       xpath=//input[@type='file' and @name='profileBackground']


# ------------------------------------------------------------
# Additional Information
# ------------------------------------------------------------

${ADDITIONAL_INFO_EDIT_ICON}        xpath=//*[normalize-space()='Additional information']/following::button[1]

${ADDITIONAL_INFO_EMAIL_INPUT}      xpath=//label[normalize-space()='Email']/following::input[1]


# ------------------------------------------------------------
# Preferred Location
# ------------------------------------------------------------

${PREFERRED_LOCATION_INPUT}    xpath=//input[@id='react-select-4-input']


# ------------------------------------------------------------
# Last Salary
# ------------------------------------------------------------

${LAST_SALARY_DROPDOWN}    xpath=(//select[contains(@name,'lastSalary')])[1]


# ------------------------------------------------------------
# Resume
# ------------------------------------------------------------

${RESUME_FILE_INPUT}    xpath=//input[@type='file' and contains(@accept,'.pdf')]


# ------------------------------------------------------------
# Preferred Industry
# ------------------------------------------------------------

${PREFERRED_INDUSTRY_FIELD}         xpath=//label[normalize-space()='Preferred Industry']/following::div[contains(@class,'react-select__control')][1]

${PREFERRED_INDUSTRY_INPUT}         xpath=//input[contains(@id,'react-select-') and contains(@id,'-input')]


# ------------------------------------------------------------
# Open For Relocation - Yes
# ------------------------------------------------------------

${RELOCATION_YES_RADIO}             xpath=(//label[contains(normalize-space(),'open for relocation')]/following::input[@type='radio'])[1]


# ------------------------------------------------------------
# Notice Period - Yes
# ------------------------------------------------------------

${NOTICE_PERIOD_YES_RADIO}          xpath=(//label[contains(normalize-space(),'Notice period')]/following::input[@type='radio'])[1]


# ------------------------------------------------------------
# Additional Information Save
# ------------------------------------------------------------

${ADDITIONAL_INFO_SAVE_BTN}         xpath=(//button[normalize-space()='Save'])[1]