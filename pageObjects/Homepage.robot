*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${homepage_button_login}                            css=.user-nav [href='\/account\/login\/to\/account']

*** Keywords ***
User Can Tap Button Sign In/Join In Homepage
    Wait Until Element Is Visible                   ${homepage_button_login}
    Click Element                                   ${homepage_button_login}
