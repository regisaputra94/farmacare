*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${loginpage_field_email}                            xpath=//input[@id='ap_email' and @placeholder='Email']
${loginpage_field_password}                         xpath=//input[@id='ap_password' and @placeholder='Book Depository password']
${loginpage_button_signin}                          css=input#signInSubmit

*** Keywords ***
Login With Credentials
    Select Frame                                    css=.signin-iframe
    User Can Input Email And Password In Login Page
    User Can Tap Button Sign In In Login Page

User Can Input Email And Password In Login Page
    [Arguments]      ${email}=${ACCOUNT_EMAIL}      ${password}=${ACCOUNT_PASSWORD}
    Wait Until Element Is Visible                   ${loginpage_field_email}
    Input Text                                      ${loginpage_field_email}            ${email}
    Wait Until Element Is Visible                   ${loginpage_field_password}
    Input Text                                      ${loginpage_field_password}         ${password}

User Can Tap Button Sign In In Login Page
    Wait Until Element Is Visible                   ${loginpage_button_signin}
    Click Element                                   ${loginpage_button_signin}
