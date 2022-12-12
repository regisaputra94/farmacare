*** Settings ***
Resource                        ../framework/router.robot

Test Timeout                    ${DEFAULT_TEST_TIMEOUT}
Test Setup                      base.Start Testing        ${URL}
Test Teardown                   base.End Testing

*** Variables ***
${URL}                          ${HOST}
${search_text}                  The

# STORIES 1
*** Test Cases ***
As User, I Can Search Book And FIlter Base Price Low To High
    [Documentation]  As User, I Can Search Book And FIlter Base Price Low To High
    [Tags]           Regression     Smoke   Stories1

    Homepage.User Can Tap Button Sign In/Join In Homepage
    LoginPage.Login With Credentials
    Homepage.User Can Search Book In Homepage       ${search_text}
    Homepage.User Can Tap Button Search
    SearchPage.User Can Tap Field Order In Search Page
    SearchPage.Verify Book Ordered By Price Low To High In Search Page          text_order=Price, low to high


#STORIES 2
As User, I Can Add, Manipulate And Remove Book To Basket
    [Documentation]  As User, I Can Search Book And FIlter Base Price Low To High
    [Tags]           Regression     Stories2
    Homepage.User Can Tap Button Sign In/Join In Homepage
    LoginPage.Login With Credentials
    Homepage.User Can Add Some Item In The Basket       3
    BasketPage.User Can Set Quantity of Item In Basket Page
    BasketPage.Verify Book Quantiity
    