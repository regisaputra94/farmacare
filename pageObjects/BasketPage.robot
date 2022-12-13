*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${basketpage_field_qty}             xpath=//select[@name='quantity']
${basketpage_selector_qty}          css=.basket-items-wrap .basket-item:nth-of-type(2) [value='{0}']
${basketpage_field_qty_selected}    xpath=//select[@name='quantity']/option[@selected='true'][1]
${basketpage_field_item_detail}     xpath=//div[@class='basket-item']
${basketpage_button_remove}         xpath=//form/button[@class='btn remove-btn'][{0}]
${basketpage_text_head_wrap}        xpath=//div[@class='checkout-head-wrap']
  

*** Keywords ***
User Can Set Quantity of Item In Basket Page
    ${Qty}=         Evaluate        random.randint(1, 10)
    Set Test Variable                       ${QUANTITY}     ${Qty}
    Wait Until Element Is Visible           ${basketpage_field_qty}
    Click Element                           ${basketpage_field_qty}
    Click Element                           ${basketpage_selector_qty.format('${Qty}')}

User Can Remove Item In Basket Page
    ${count} =           Get Element Count              ${basketpage_field_item_detail}
    FOR     ${index}    IN RANGE   1     ${count}+1
        Scroll Element Into View            ${basketpage_button_remove.format('${index}')}
        Wait Until Element Is Visible       ${basketpage_button_remove.format('${index}')}
        Click Element                       ${basketpage_button_remove.format('${index}')}
    END

Verify Item Empty In Basket
    Element Text Should Be                  ${basketpage_text_head_wrap}     Your basket is empty.