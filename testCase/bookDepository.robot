*** Settings ***
Resource                        ../framework/router.robot

Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      base.Start Testing        ${URL}
Test Teardown                   base.End Testing

*** Variables ***
${URL}                          ${HOST}
${search_text}                  The

*** Test Cases ***
As User, I Can Search Book And FIlter Base Price Low To High
    [Documentation]  As User, I Can Search Book And FIlter Base Price Low To High
    [Tags]           Smoke

    Homepage.User Can Tap Button Sign In/Join In Homepage
    LoginPage.Login With Credentials
    Homepage.User Can Search Book In Homepage       ${search_text}
    Homepage.User Can Tap Button Search
    SearchPage.User Can Tap Field Order In Search Page
    Sleep   10
