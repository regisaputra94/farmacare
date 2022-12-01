*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${homepage_button_login}                            css=.user-nav [href='\/account\/login\/to\/account']
${homepage_field_search}                            css=input[name='searchTerm']
${homepage_button_search}                           //form[@id='book-search-form']//button[@class='header-search-btn']/span[@class='text']

*** Keywords ***
User Can Tap Button Sign In/Join In Homepage
    Wait Until Element Is Visible                   ${homepage_button_login}
    Click Element                                   ${homepage_button_login}

User Can Search Book In Homepage
    [Arguments]         ${search_text}
    Wait Until Element Is Visible                   ${homepage_field_search}
    Input Text                                      ${homepage_field_search}            ${search_text}

User Can Tap Button Search
    Wait Until Element Is Visible                   ${homepage_button_search}
    Click Element                                   ${homepage_button_search}