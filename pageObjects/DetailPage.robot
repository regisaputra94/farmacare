*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${detailpage_button_addtowishlist}          css=.add-to-wishlist
${detailpage_modal_button_add}              css=.btn-add
${detailpage_modal_gotowishlist}            css=.link-to-localize

*** Keywords ***
User Can Tap Add to Wishlist
    Wait Until Element Is Visible           ${detailpage_button_addtowishlist}
    Click Element                           ${detailpage_button_addtowishlist}

User Can Tap Add Item To Add Item To Wishlist
    Wait Until Element Is Visible           ${detailpage_modal_button_add}
    Click Element                           ${detailpage_modal_button_add}

User Can Tap Go To Wishlist To Direct Wishlist Page
    ${wishlist}=         Run Keyword And Return Status                 Wait Until Element Is Visible      ${detailpage_modal_gotowishlist}
    Run Keyword If    ${wishlist}=='False'     Click Element           ${detailpage_modal_gotowishlist}

