# LinkCXO automated test-case details

## Scope and execution preconditions

- The suites use Selenium/Chrome against the configured environment in `Resources/Variables/Config.robot` (currently `https://dev.cxostory.in/`).
- Most modules require a valid account and the six-digit OTP currently entered by the scripts (`444444`). Signup tests additionally require usable, unique contact data.
- Test media must be present under `Images/`. The Article flow additionally refers to `D:\images3.jpg`, which is machine-specific.

## Module-wise test cases

| ID | Module / script | Scenario and test data | What the automation does | Expected result / current verification |
|---|---|---|---|---|
| AUTH-01 | Login — `Tests/Login.robot` | Login with configured email and OTP | Opens Login, enters email, enters six OTP digits, verifies OTP | Home page and user-profile link are visible. This is explicitly verified. |
| SIGNUP-01 | Email signup — `Tests/SignupWithEmail.robot` | Register with a valid email; captures first/last name, company, designation, experience, phone and LinkedIn URL | Validates email format, submits email/OTP, completes onboarding form | Onboarding Continue is clicked and a screenshot is captured. The script does **not** assert account creation, redirect, or displayed profile details. |
| SIGNUP-02 | Mobile signup — `Tests/SignupWithMobile.robot` | Register with a 10-digit mobile number; captures email and professional profile data | Validates the mobile-number format, submits mobile/OTP, completes onboarding form | Onboarding Continue is clicked and a screenshot is captured. No post-signup success/profile assertion is present. |
| POST-01 | Post — `Tests/CreatePost.robot` | Create a text post with `post-image.jpg` | Opens Post composer, selects Post, enters text, uploads image, submits | Composer closes/returns to the home Post button. It does **not** verify that the created post text or image is visible in the feed. |
| POST-02 | Post keyword coverage only | Create text post with PDF document | `Create Post With Document` uploads `post-document.pdf` and submits | Returns to home Post button; this scenario is implemented but is not called by a test suite. |
| POST-03 | Post keyword coverage only | Create text post with video | `Create Post With Video` uploads `post-video.mp4` and submits | Returns to home Post button; this scenario is implemented but is not called by a test suite. |
| QUERY-01 | Query — `Tests/CreateQuery.robot` | Create a query with category, question and description | Opens Post menu, selects Query, chooses category, fills question/description, saves | Query success message must be visible. This is explicitly verified. |
| POLL-01 | Poll — `Tests/CreatePoll.robot` | Create a poll with question, category and two options | Opens Post menu, selects Poll, enters question, selects category, enters two options, saves | Poll success message must be visible. This is explicitly verified. |
| ARTICLE-01 | Article — `Tests/CreateArticle.robot` | Publish an article with cover image, title and rich-text content | Opens Post menu, selects Compose Article, uploads image, enters title/content and publishes | Article success message must be visible. This is explicitly verified, but the locator is noted in code as potentially unconfirmed. |
| SURVEY-01 | Survey — `Tests/CreateSurvey.robot` | Create a survey with title, description, category, two questions, question types/options and one-week duration | Builds Question 1 as multiple choice (three options) and Question 2 as select type (two options), then creates the survey | Create action is performed and a screenshot is captured. No success message or visible-survey assertion is present. |
| CLUB-01 | Club — `Tests/CreateClub.robot` | Create a public club with image, name, industry, category and description | Navigates through hamburger menu to Clubs, completes details, proceeds Next and Create | Creation is clicked and a screenshot is captured. No confirmation message or club-card verification is present. |
| CLUB-02 | Club — `Tests/CreateClub.robot` | Create a private club with the same required details | Repeats CLUB-01 with private type selected | Same as CLUB-01; no explicit persistence assertion. |
| EVENT-01 | Event — `Tests/CreateEvent.robot` | Create a public event with image, title, type, industry/category, host, registration link, venue and date/time | Navigates to Events, completes the two-step form and creates the event | Opens **My events** and verifies that the configured public-event title is present. This is explicitly verified. |
| EVENT-02 | Event — `Tests/CreateEvent.robot` | Create a private event with the same details | Creates a second event with private type selected | Opens **My events** and verifies that the configured private-event title is present. This is explicitly verified. |
| PROFILE-01 | Profile — `Tests/UpdateProfile.robot` | Update photo, banner and additional information | Uploads photo/banner/resume; updates email/location/salary/industry; selects relocation and notice-period values | Saves the additional-information modal. The script does not reload and assert every saved value. |
| PROFILE-02 | Profile — `Tests/UpdateProfile.robot` | Update About description, skills and interests | Replaces description, clears/adds multi-select skills/interests and saves | Reloads/navigates after save, but does not assert the saved content. |
| PROFILE-03 | Profile — `Tests/UpdateProfile.robot` | Add education | Adds degree, institution, field, location and start/end dates | Saves education and refreshes the profile; no visible-record assertion. |
| PROFILE-04 | Profile — `Tests/UpdateProfile.robot` | Add current employment | Adds job title, description, employer, location, start date and “currently working” | Saves and refreshes; no visible-record assertion. |

## Regression-suite status

`Tests/Regression.robot` groups the above smoke/regression coverage. A dry run on 14 August 2026 resolves 10 of its 11 test cases. The profile regression case cannot run because it calls three undefined keywords:

- `Add User Award And Certification`
- `Add User Publication`
- `Add User English Language`

The standalone profile suite does not call these missing keywords and therefore covers only PROFILE-01 through PROFILE-04.

## Recommended completion criteria

For a business-valid “pass”, add a unique run suffix to titles/names, then verify the created or updated record after a refresh/relogin:

- Posts: find the exact text and attachment in the feed.
- Survey and clubs: verify a success notification and the created item/title in its listing.
- Signup: verify the user reaches the home/profile page and can log in again.
- Profile: verify each saved value and each added record in the corresponding tab.
- Keep OTPs, emails, phone numbers and file paths out of source control; inject them through protected runtime variables.

## Not currently covered

Negative and boundary cases are absent: invalid/expired OTP, duplicate signup, invalid mandatory fields, upload type/size validation, cancel/back flows, privacy/access control for private clubs/events, error handling, edit/delete, search/filter, and role/permission checks.
