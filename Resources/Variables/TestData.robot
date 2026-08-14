*** Variables ***

# ==========================================
# Login Test Data
# ==========================================

${EMAIL}                         linkcxo123@gmail.com
${OTP}                           444444

# Signup test data
${SIGNUP_EMAIL}                  linkcxo123@gmail.com
${SIGNUP_EMAIL_MOBILE}           8484848485
${SIGNUP_MOBILE}                 9999999999
${SIGNUP_MOBILE_EMAIL}           kprabhat99999@gmail.com

# ==========================================
# Post Test Data
# ==========================================

${POST_CONTENT}       This is an automated test post.

${POST_IMAGE}         C:/LinkCXO_RobotFramework/Images/post-image.jpg
${POST_DOCUMENT}      C:/LinkCXO_RobotFramework/Images/post-document.pdf
${POST_VIDEO}         C:/LinkCXO_RobotFramework/Images/post-video.mp4

# ==========================================
# Survey Test Data
# ==========================================

${SURVEY_TITLE}                  Automation Survey
${SURVEY_DESCRIPTION}            Survey created using Robot Framework Automation.

${SURVEY_QUESTION_1}             How satisfied are you with our product/service?
${SURVEY_QUESTION_2}             Do you have the tools and resources you need to succeed?

${SURVEY_OPTION_1}               Very Likely
${SURVEY_OPTION_2}               Likely
${SURVEY_OPTION_3}               Neutral

${SURVEY_Q2_OPTION_1}            YES
${SURVEY_Q2_OPTION_2}            NO

# ==========================================
# Poll Test Data
# ==========================================

${POLL_QUESTION_TEXT}    What is your favorite feature on LinkCXO?
${POLL_OPTION_1}         Networking
${POLL_OPTION_2}         Job Board

# ==========================================
# Club Test Data
# ==========================================

${CLUB_NAME}                     Automation Club
${CLUB_DESCRIPTION}              This club is created using Robot Framework.
${CLUB_IMAGE}                    C:\\LinkCXO_RobotFramework\\Images\\post-image.jpg

# ==========================================
# Article Test Data
# ==========================================

${ARTICLE_TITLE_TEXT}    Automation Article
${ARTICLE_DESCRIPTION_TEXT}    A short guide to building meaningful professional relationships
${ARTICLE_CONTENT_TEXT}        Networking is one of the most underrated skills for senior leaders...
${ARTICLE_TAGS_TEXT}           leadership
${SAMPLE_FILE_PATH}    D:\\images3.jpg

# ==========================================
# Query Test Data
# ==========================================

${QUERY_QUESTION_TEXT}       How do I update my company profile?
${QUERY_DESCRIPTION_TEXT}    Need help finding where to edit company details on LinkCXO

# ==========================================
# Event Test Data
# ==========================================

${EVENT_TITLE_PUBLIC}                Automation Event - Public
${EVENT_TITLE_PRIVATE}               Automation Event - Private
${EVENT_DESCRIPTION_TEXT}            This event is created using Robot Framework.
${EVENT_ADDRESS}                     123 Automation Street, Test City
${EVENT_HOST_EMAIL}                  support@gmail.com
${EVENT_IMAGE}                       C:\\LinkCXO_RobotFramework\\Images\\post-image.jpg
${EVENT_START_TIME_VALUE}            09:00
${EVENT_END_TIME_VALUE}              11:00
${EVENT_REGISTRATION_LINK_VALUE}     https://in.bookmyshow.com/explore/events-mumbai

# ============================================================
# PROFILE UPDATE TEST DATA
# ============================================================

# Login
${PROFILE_UPDATE_LOGIN_EMAIL}          ${EMAIL}

# ------------------------------------------------------------
# Profile Image
# ------------------------------------------------------------

${PROFILE_PHOTO_PATH}                  ${EXECDIR}${/}Images${/}profile_image.png

# ------------------------------------------------------------
# Profile Banner
# ------------------------------------------------------------

${PROFILE_BANNER_PATH}                 ${EXECDIR}${/}Images${/}banner_image.jpg

# ------------------------------------------------------------
# Additional Information
# ------------------------------------------------------------

${PROFILE_UPDATE_PREFERRED_LOCATION}   Mumbai
${PROFILE_UPDATE_LAST_SALARY}    50 Lacs

# ------------------------------------------------------------
# Resume
# ------------------------------------------------------------

${PROFILE_UPDATE_RESUME}               ${EXECDIR}${/}Images${/}prabhat_resume.pdf


# ------------------------------------------------------------
# Preferred Industry
# ------------------------------------------------------------

${PROFILE_UPDATE_PREFERRED_INDUSTRY}    IT & ITES
${PROFILE_ABOUT_DESCRIPTION}            Maintaining relationships with clients, partners and other stakeholders. Managing the profits and losses of the organization or a specific division. Developing goals and initiatives to direct the company's course. Guiding managers on implementing company initiatives and policies.
@{PROFILE_ABOUT_SKILLS}                 Python    Digital Marketing    Full-Stack Development
@{PROFILE_ABOUT_INTERESTS}              CXO Networking    Industry Events

${EDU_DEGREE}          B.Sc Computer Science
${EDU_INSTITUTION}     Stanford University
${EDU_FIELD_OF_STUDY}  Computer Science
${EDU_LOCATION}        California, USA
${EDU_START_MONTH}     Jan
${EDU_START_YEAR}      2015
${EDU_END_MONTH}       Jun
${EDU_END_YEAR}        2019

# ------------------------------------------------------------
# Experience
# ------------------------------------------------------------
${EXP_JOB_TITLE}       Zonal Head
${EXP_DESCRIPTION}     I am working as a zone head at Alfatech Private Limited
${EXP_COMPANY_NAME}    Alfatech Private Limited
${EXP_LOCATION}        Navi Mumbai
${EXP_START_MONTH}     Mar
${EXP_START_YEAR}      2018

# ------------------------------------------------------------
# Awards & Certification
# ------------------------------------------------------------
${AWARD_TITLE}         Best Product Manger
${AWARD_CERTIFIED_BY}  Gyanesh Kumar
${AWARD_ISSUED_DATE}   January 01 2018
${AWARD_DESCRIPTION}   Award descriptions

# ------------------------------------------------------------
# Publications
# ------------------------------------------------------------
${PUBLICATION_TITLE}          Evolution 2.0
${PUBLICATION_PUBLISHED_BY}   Gyanesh Kumar
${PUBLICATION_PUBLISHED_ON}   01-01-2024
${PUBLICATION_DESCRIPTION}    This is the descrition of publication


