*** Variables ***

# ==========================
# Login Page Locators
# ==========================

${LOGIN_BUTTON}         xpath=//button[normalize-space()='Login']
${EMAIL_INPUT}          xpath=//input[@id='emailId']
${CONTINUE_BUTTON}      xpath=//button[contains(normalize-space(),'Continue')]

# OTP Fields
${OTP_INPUT_1}          xpath=//input[@name='otp-input-0']
${OTP_INPUT_2}          xpath=//input[@name='otp-input-1']
${OTP_INPUT_3}          xpath=//input[@name='otp-input-2']
${OTP_INPUT_4}          xpath=//input[@name='otp-input-3']
${OTP_INPUT_5}          xpath=//input[@name='otp-input-4']
${OTP_INPUT_6}          xpath=//input[@name='otp-input-5']

# Verify Button (used with Execute JavaScript)
${VERIFY_BUTTON_XPATH}  //button[contains(@class,'mb-8') and contains(normalize-space(),'Continue')]

# Home Page
${HOME_PAGE}            xpath=//body

# ==========================================
# Home Page / Post
# ==========================================

${POST_BUTTON_HOME}    xpath=//button[normalize-space()='Post']
${POST_OPTION}         xpath=//h1[normalize-space()='Create a post']
${POST_TEXTBOX}        xpath=//textarea[@rows='10']

${IMAGE_UPLOAD}        xpath=(//input[@type='file'])[1]
${DOCUMENT_UPLOAD}     xpath=//input[@name='attachment' and @type='file']
${VIDEO_UPLOAD}        xpath=//input[@name='video' and @type='file']

${SUBMIT_POST}         xpath=//button[normalize-space()='Post']

# ==========================================
# Survey Locators
# ==========================================

${POST_BUTTON}                        xpath=//button[normalize-space()='Post']
${SURVEY_OPTION}                      xpath=//h1[contains(normalize-space(),'Create a survey')]

# Survey Details
${SURVEY_TITLE_INPUT}                 xpath=(//input[@id='title'])[1]
${SURVEY_DESCRIPTION_INPUT}           xpath=(//textarea[@id='description'])[1]

# Category
${CATEGORY_DROPDOWN}                  xpath=//label[contains(.,'Category')]/following::div[contains(@class,'control')][1]
${CATEGORY_OPTION}                    xpath=//div[@role='option' and normalize-space()='Business Growth']

# Question 1
${QUESTION1_INPUT}                    xpath=//input[@id='questions.question-0']

# Question Type
${QUESTION_TYPE1_DROPDOWN}            xpath=(//div[contains(@class,'control')])[2]
${MULTIPLE_CHOICE_OPTION}             xpath=//div[@role='option' and normalize-space()='Multiple Choice']

# Question 1 Options
${OPTION1_INPUT}                      xpath=//input[@name='questions.0.options.0.option']
${OPTION2_INPUT}                      xpath=//input[@name='questions.0.options.1.option']
${ADD_OPTION_BUTTON}                  xpath=//button[.//span[text()='+'] and contains(.,'Add Option')]
${OPTION3_INPUT}                      xpath=//input[@name='questions.0.options.2.option']

# Question 2
${QUESTION2_INPUT}                    xpath=//input[@id='questions.question-1']

# Question 2 Type
${QUESTION_TYPE2_DROPDOWN}            xpath=//input[@id='questions.question-1']/ancestor::div[contains(@class,'space-y')][1]//div[contains(@class,'control')]
${SELECT_OPTION_TYPE}                 xpath=//div[@role='option'][normalize-space()='Select Option']

# Question 2 Options
${QUESTION2_OPTION1_INPUT}            xpath=//input[@name='questions.1.options.0.option']
${QUESTION2_OPTION2_INPUT}            xpath=//input[@name='questions.1.options.1.option']

# Survey Duration
${SURVEY_DURATION_DROPDOWN}           xpath=//label[normalize-space()='Survey Duration']/following::div[contains(@class,'control')][1]
${ONE_WEEK_OPTION}                    xpath=//div[@role='option' and normalize-space()='In 1 Week']

# Create Survey
${CREATE_SURVEY_BUTTON}               xpath=//button[@type='submit' and normalize-space()='Create Survey']


# ==========================
# Poll Page
# ==========================
${CREATE_POLL_OPTION}      xpath=//h1[contains(normalize-space(),'Create a poll')]
${POLL_QUESTION}           xpath=(//textarea[@id='question'])[1]

# Category (reuses the same dropdown component as Survey; first option selected
# rather than hardcoding a name, since the exact category list isn't confirmed)
${FIRST_CATEGORY_OPTION}   xpath=//div[@role='option'][1]

# Poll Options — placeholders are distinct per field ("Option 1", "Option 2"...),
# not a shared "Option" placeholder indexed by position
${OPTION_1}                xpath=//input[@placeholder='Option 1']
${OPTION_2}                xpath=//input[@placeholder='Option 2']
${OPTION_3}                xpath=//input[@placeholder='Option 3']
${OPTION_4}                xpath=//input[@placeholder='Option 4']
${POLL_ADD_OPTION_BUTTON}  xpath=//button[contains(.,'Add Option')]

# Save (poll has no duration step — that was a wrong carryover from Survey)
${SAVE_POLL_BUTTON}        xpath=//button[normalize-space()='Save']

${POLL_SUCCESS_MESSAGE}    xpath=//*[contains(text(),'success') or contains(text(),'Poll created')]

# ==========================
# Article Page
# ==========================
${CREATE_ARTICLE_OPTION}         xpath=//h1[normalize-space()='Compose an article']
${ARTICLE_UPLOAD_IMAGE}          xpath=(//input[@type='file'])[1]
${ARTICLE_TITLE}                 xpath=//input[@placeholder='Enter article title']
${ARTICLE_CONTENT}               xpath=//div[contains(@class,'ql-editor')]
${ARTICLE_PUBLISH_BUTTON}        xpath=//button[normalize-space()='Publish']
${ARTICLE_PUBLISH_BUTTON_XPATH}  //button[normalize-space()='Publish']
${ARTICLE_SUCCESS_MESSAGE}       xpath=//*[contains(text(),'success') or contains(text(),'Article created')]

# ==========================
# Query Page
# ==========================
${CREATE_QUERY_OPTION}        xpath=//h1[contains(normalize-space(),'Post as a query')]
${QUERY_CATEGORY_DROPDOWN}    xpath=//label[contains(text(),'Categ')]/following::div[1]
${QUERY_CATEGORY_OPTION}      xpath=//div[@role='option'][1]
${QUERY_QUESTIONS}            xpath=//input[@placeholder='Enter Questions']
${QUERY_DESCRIPTION}          xpath=//textarea[@placeholder='Add a brief description']
${QUERY_SAVE_BUTTON}          xpath=//button[normalize-space()='Save Query']
${QUERY_SUCCESS_MESSAGE}      xpath=//*[contains(text(),'success') or contains(text(),'Query created')]


# ==========================
# Club Page
# ==========================
${HAMBURGER_MENU}            xpath=//div[@class='cursor-pointer hover:scale-110 ']//*[name()='svg']
${CLUB_MENU}                 xpath=//h2[normalize-space()='Clubs']
${CREATE_CLUB_BUTTON}        xpath=//button[normalize-space()='Create Club']
${CLUB_IMAGE_UPLOAD}         xpath=//input[@type='file' and @accept='.jpg,.jpeg,.png']
${CLUB_NAME_INPUT}           xpath=(//input[@placeholder='Enter Title'])[1]
${CLUB_DESCRIPTION_INPUT}    xpath=(//textarea[@placeholder='Enter Here'])[1]
${NEXT_BUTTON}                xpath=(//button[normalize-space()='Next'])[1]
${CREATE_BUTTON}              xpath=(//button[normalize-space()='Create'])[1]
${CLUB_INDUSTRY_DROPDOWN}     xpath=//label[contains(text(),'Industry')]/following::div[1]
${CLUB_INDUSTRY_OPTION}       xpath=(//div[@role='option'])[1]
${CLUB_CATEGORY_DROPDOWN}     xpath=//label[contains(text(),'Category')]/following::div[1]
${CLUB_CATEGORY_OPTION}       xpath=(//div[@role='option'])[2]
${CLUB_TYPE_PUBLIC}     xpath=//input[@name='isPrivate' and @value='false']
${CLUB_TYPE_PRIVATE}    xpath=//input[@name='isPrivate' and @value='true']

# ==========================
# Event Page
# ==========================
${EVENTS_MENU}                xpath=//h2[contains(text(),'Events')]
${CREATE_EVENT_BUTTON}         xpath=//button[normalize-space()='Create Event']
${EVENT_IMAGE_UPLOAD}          xpath=//input[@type='file']
${EVENT_TITLE_INPUT}           xpath=(//input[@placeholder='Enter Title'])[1]
${EVENT_TYPE_PUBLIC}           xpath=(//input[@name='isPrivate'])[1]
${EVENT_TYPE_PRIVATE}          xpath=(//input[@name='isPrivate'])[2]
${EVENT_INDUSTRY_DROPDOWN}     xpath=//label[.='Industry']/following::div[1]
${EVENT_INDUSTRY_OPTION}       xpath=//div[text()='Professional Services']
${EVENT_CATEGORY_DROPDOWN}     xpath=//label[.='Category']/following::div[1]
${EVENT_CATEGORY_OPTION}       xpath=//div[text()='Business Growth']
${EVENT_DESCRIPTION}           xpath=//textarea[contains(@placeholder,'Enter Here')]
${EVENT_HOST_DROPDOWN}         xpath=//label[text()='Host *']/following::div[1]
${EVENT_HOST_OPTION}           xpath=//option[@value='Individual']
${EVENT_REGISTRATION_LINK}     xpath=//input[@placeholder='Registration Link']
${EVENT_ADDRESS_INPUT}         xpath=(//input[@placeholder='Enter Address'])[1]
${EVENT_START_DATE}            xpath=(//input[@placeholder='Select Date'])[1]
${EVENT_END_DATE}              xpath=(//input[@placeholder='Select Date'])[2]
${EVENT_DATE_28}               xpath=//div[contains(@class,'react-datepicker__day--028')]
${EVENT_START_TIME}            xpath=//input[@name='startTime']
${EVENT_END_TIME}              xpath=//input[@name='endTime']
${EVENT_HOST_EMAIL_INPUT}      xpath=//input[@placeholder='support@gmail.com']
${EVENT_NEXT_BUTTON}           xpath=//button[normalize-space()='Next']
${EVENT_CREATE_BUTTON}         xpath=//button[normalize-space()='Create']
${MY_EVENTS_TAB}               xpath=//*[normalize-space()='My events']