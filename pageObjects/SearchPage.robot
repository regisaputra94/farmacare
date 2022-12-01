*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${searchpage_field_order_by}                        css=[onchange='this\.form\.submit\(\)']
${searchpage_selector_lowtohigh}                    css=select[name='searchSortBy'] > option[value='price_low_high']

*** Keywords ***
User Can Tap Field Order In Search Page
    Wait Until Element Is Visible                   ${searchpage_field_order_by}
    Click Element                                   ${searchpage_field_order_by}
    Click Element                                   ${searchpage_selector_lowtohigh}
