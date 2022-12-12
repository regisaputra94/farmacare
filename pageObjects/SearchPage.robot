*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${searchpage_field_order_by}                        css=[onchange='this\.form\.submit\(\)']
${searchpage_selector_lowtohigh}                    css=select[name='searchSortBy'] > option[value='price_low_high']
${searchpage_text_order_by}                         xpath=//form[@method='GET']/select[@name='searchSortBy']/option[@selected='selected']

*** Keywords ***
User Can Tap Field Order In Search Page
    Wait Until Element Is Visible                   ${searchpage_field_order_by}
    Click Element                                   ${searchpage_field_order_by}
    Click Element                                   ${searchpage_selector_lowtohigh}

Verify Book Ordered By Price Low To High In Search Page
    [Arguments]                                     ${text_order}
    Element Text Should Be                          ${searchpage_text_order_by}     ${text_order}
