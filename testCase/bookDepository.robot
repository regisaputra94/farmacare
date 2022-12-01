*** Settings ***
Resource                        ../framework/router.robot

Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      base.Start Testing        ${URL}
Test Teardown                   base.End Testing

*** Variables ***
${URL}                          ${HOST}

*** Test Cases ***
As User, I Can Search Book And FIlter Base Price Low To High
    [Documentation]  As User, I Can Search Book And FIlter Base Price Low To High
    [Tags]           Smoke

    Homepage.User Can Tap Button Sign In/Join In Homepage
    LoginPage.Login With Credentials