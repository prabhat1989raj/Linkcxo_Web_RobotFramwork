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
${ARTICLE_PUBLISH_BUTTON_XPATH}    xpath=//button[normalize-space()='Publish']
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
${ADDITIONAL_INFO_MODAL_TITLE}      xpath=//*[normalize-space()='Edit additional information']
${ADDITIONAL_INFO_CLOSE_BTN}        xpath=//*[normalize-space()='Edit additional information']/following::button[1]


# ------------------------------------------------------------
# Preferred Location
# ------------------------------------------------------------

${PREFERRED_LOCATION_CONTAINER}    xpath=(//div[contains(@class,'css-79z28i')])[1]
${PREFERRED_LOCATION_INPUT}        xpath=(//div[contains(@class,'css-79z28i')])[1]//input


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

${PREFERRED_INDUSTRY_INPUT}    xpath=//label[normalize-space()='Preferred industry']/following::input[1]


# ------------------------------------------------------------
# Open For Relocation - Yes
# ------------------------------------------------------------

${RELOCATION_YES_RADIO}       xpath=//input[@type='radio' and @name='relocation' and @value='Yes']/parent::label


# ------------------------------------------------------------
# Notice Period - Yes
# ------------------------------------------------------------

${NOTICE_PERIOD_YES_RADIO}    xpath=//input[@type='radio' and @name='onNoticePeriod' and @value='Yes']/parent::label


# ------------------------------------------------------------
# Additional Information Save
# ------------------------------------------------------------

${ADDITIONAL_INFO_SAVE_BTN}    xpath=(//button[@type='submit' and normalize-space()='Save'])[1]

# ------------------------------------------------------------
# About
# ------------------------------------------------------------

${ABOUT_EDIT_ICON}             xpath=(//*[normalize-space()='About'])[last()]/following::button[1]
${ABOUT_DESCRIPTION_INPUT}     xpath=(//textarea)[last()]
${ABOUT_SKILLS_INPUT}          xpath=//*[normalize-space()='Skills']/following::input[1]
${ABOUT_INTERESTS_INPUT}       xpath=//*[normalize-space()='Interests']/following::input[1]
${ABOUT_SAVE_BTN}              xpath=//button[@type='submit' and normalize-space()='Save Changes']
${EDUCATION_TAB}               xpath=//button[normalize-space()='Education']
${EXPERIENCE_TAB}              xpath=//button[normalize-space()='Experience']

# ------------------------------------------------------------
# Add Education Modal
# ------------------------------------------------------------

${EDUCATION_ADD_BTN}            xpath=//*[normalize-space()='Education']/following::button[@title='Add'][1]
${ADD_EDUCATION_MODAL_TITLE}    xpath=//*[normalize-space()='Add Education']

${EDU_DEGREE_INPUT}             xpath=(//input[@name='degree' and not(@type='hidden')])[last()]
${EDU_INSTITUTION_INPUT}        xpath=(//input[@name='school' and not(@type='hidden')])[last()]
${EDU_FIELD_OF_STUDY_INPUT}     xpath=(//input[@name='fieldStudy' and not(@type='hidden')])[last()]
${EDU_LOCATION_INPUT}           xpath=(//input[@name='location' and not(@type='hidden')])[last()]

${EDU_START_MONTH_DROPDOWN}     xpath=(//*[normalize-space()='Start Date']/following::*[self::select or self::button or @role='combobox'])[1]
${EDU_START_YEAR_DROPDOWN}      xpath=(//*[normalize-space()='Start Date']/following::*[self::select or self::button or @role='combobox'])[2]
${EDU_END_MONTH_DROPDOWN}       xpath=(//*[normalize-space()='End Date']/following::*[self::select or self::button or @role='combobox'])[1]
${EDU_END_YEAR_DROPDOWN}        xpath=(//*[normalize-space()='End Date']/following::*[self::select or self::button or @role='combobox'])[2]

${EDU_CURRENTLY_STUDYING_CHECKBOX}    xpath=//input[@id='currentlyStudying']

${EDU_SAVE_BTN}                 xpath=//button[@type='submit' and normalize-space()='Add Education']

# ------------------------------------------------------------
# Add Experience Modal
# ------------------------------------------------------------
${EXPERIENCE_ADD_BTN}           xpath=(//*[normalize-space()='Experience'])[last()]/following::button[@title='Add'][1]
${ADD_EXPERIENCE_MODAL_TITLE}   xpath=//*[normalize-space()='Add Experience']
${EXP_JOB_TITLE_INPUT}          xpath=//input[@name='desgnation']
${EXP_DESCRIPTION_INPUT}        xpath=//textarea[@placeholder='Description']
${EXP_COMPANY_NAME_INPUT}       xpath=//input[@placeholder='e.g. Technocorp']
${EXP_LOCATION_INPUT}           xpath=//input[@placeholder='e.g.San Francisco, CA']
${EXP_START_MONTH_DROPDOWN}     xpath=//select[@name='startMonth']
${EXP_START_YEAR_DROPDOWN}      xpath=//select[@name='startYear']
${EXP_CURRENTLY_WORKING}        id=currentWorkingStatus
${EXP_SAVE_BTN}                 xpath=//button[@type='submit' and normalize-space()='Add Experience']

# ------------------------------------------------------------
# Awards & Certification
# ------------------------------------------------------------
${AWARDS_CERTIFICATION_TAB}     xpath=//button[normalize-space()='Awards & Certification']
${AWARDS_HEADING}               xpath=(//*[normalize-space()='Awards & Certification'])[last()]
${ADD_AWARD_BTN}                xpath=(//*[normalize-space()='Awards & Certification'])[last()]/following::button[@title='Add'][1]
${ADD_AWARD_MODAL_TITLE}        xpath=//*[normalize-space()='Add Awards & Certification']
${AWARD_TITLE_INPUT}            xpath=//label[normalize-space()='Award / Certification Title']/following::input[1]
${AWARD_CERTIFIED_BY_INPUT}     xpath=//label[normalize-space()='Issued By / Organization']/following::input[1]
${AWARD_ISSUED_DATE_INPUT}      xpath=//label[normalize-space()='Issued Date']/following::input[1]
${AWARD_DESCRIPTION_INPUT}      xpath=//label[normalize-space()='Description']/following::textarea[1]
${AWARD_SAVE_BTN}               xpath=//button[@type='submit' and normalize-space()='Add Awards & Certification']

# ------------------------------------------------------------
# Publications
# ------------------------------------------------------------
${PUBLICATIONS_TAB}             xpath=//button[normalize-space()='Publications']
${PUBLICATIONS_HEADING}         xpath=(//*[normalize-space()='Publications'])[last()]
${ADD_PUBLICATION_BTN}          xpath=(//*[normalize-space()='Publications'])[last()]/following::button[@title='Add'][1]
${PUBLICATION_TITLE_INPUT}      xpath=//label[normalize-space()='Publication Title']/following::input[1]
${PUBLICATION_PUBLISHED_BY_INPUT}    xpath=//label[normalize-space()='Published By']/following::input[1]
${PUBLICATION_PUBLISHED_ON_INPUT}    xpath=//label[normalize-space()='Publication Date']/following::input[1]
${PUBLICATION_DESCRIPTION_INPUT}     xpath=//label[normalize-space()='Description']/following::textarea[1]
${PUBLICATION_SAVE_BTN}         xpath=//button[@type='submit' and normalize-space()='Save Changes']

# ------------------------------------------------------------
# Languages
# ------------------------------------------------------------
${LANGUAGES_TAB}                xpath=//button[normalize-space()='Languages']
${LANGUAGES_HEADING}            xpath=(//*[normalize-space()='Languages'])[last()]
${EDIT_LANGUAGES_BTN}           xpath=(//*[normalize-space()='Languages'])[last()]/following::button[1]
${LANGUAGE_DROPDOWN}            xpath=//label[normalize-space()='Language']/following::input[@role='combobox'][1]
${LANGUAGE_ENGLISH_OPTION}      xpath=//*[@role='option' and normalize-space()='English']
${LANGUAGE_READING}             xpath=(//label[normalize-space()='Reading'])[1]
${LANGUAGE_WRITING}             xpath=(//label[normalize-space()='Writing'])[1]
${LANGUAGE_SPEAKING}            xpath=(//label[normalize-space()='Speaking'])[1]
${LANGUAGE_ADD_BTN}             xpath=(//button[normalize-space()='Add'])[1]
${LANGUAGE_SAVE_BTN}            xpath=//button[normalize-space()='Add Language']
