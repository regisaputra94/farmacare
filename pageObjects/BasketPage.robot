*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${basketpage_field_qty}             xpath=//select[@name='quantity']
${basketpage_selector_qty}          css=.basket-items-wrap .basket-item:nth-of-type(2) [value='{0}']
${basketpage_field_qty_selected}    xpath=//select[@name='quantity']/option[@selected='true']


*** Keywords ***
User Can Set Quantity of Item In Basket Page
    ${Qty}=         Evaluate        random.randint(1, 10)
    Set Test Variable                       ${QUANTITY}     ${Qty}
    Wait Until Element Is Visible           ${basketpage_field_qty}
    Click Element                           ${basketpage_field_qty}
    Click Element                           ${basketpage_selector_qty.format('${Qty}')}

Verify Book Quantiity
    [Arguments]                                     ${quantity}=${QUANTITY}
    Element Text Should Be                          ${basketpage_field_qty_selected}     ${quantity}
