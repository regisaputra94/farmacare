*** Settings ***
Resource            ../framework/router.robot

*** Variables ***
${homepage_button_login}                            css=.user-nav [href='\/account\/login\/to\/account']
${homepage_field_search}                            css=input[name='searchTerm']
${homepage_button_search}                           xpath=//form[@id='book-search-form']//button[@class='header-search-btn']/span[@class='text']
${homepage_button_add_to_basket}                    xpath=//div[@class='item-actions']/div/a[@class='btn btn-sm btn-primary add-to-basket'][{0}]
${homepage_button_continue_shopping}                xpath=//a[.='Continue Shopping']
${homepage_modal_button_basket}                     xpath=//div[@class='modal-dialog modal-md']//a[@href='/basket']

${homepage_img_button_item}                         xpath=//div[@class='book-item']/div[@class='item-img']/a/img[{0}]

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

User Can Tap Add To Basket Button In Book Item
    [Arguments]         ${item_index}
    Wait Until Element Is Visible                   ${homepage_button_add_to_basket.format('${item_index}')}
    Click Element                                   ${homepage_button_add_to_basket.format('${item_index}')}

User Can Tap Button Continue Shopping In Modal Item Added To Basket
    Wait Until Element Is Visible                   ${homepage_button_continue_shopping}
    Click Element                                   ${homepage_button_continue_shopping}

User Can Tap Button Basket To Direct Basket Page
    Wait Until Element Is Visible                   ${homepage_modal_button_basket}
    Click Element                                   ${homepage_modal_button_basket}

User Can Add Some Item In The Basket
    [Arguments]         ${range}
    FOR  ${index}  IN RANGE     1  ${range}+1
        User Can Tap Add To Basket Button In Book Item      1
        IF  ${index} == ${range}
            User Can Tap Button Basket To Direct Basket Page
        ELSE
            User Can Tap Button Continue Shopping In Modal Item Added To Basket
        END
    END

User Can Tap Item Book In The Homepage
    [Arguments]         ${index}
    Wait Until Element Is Visible                   ${homepage_img_button_item.format('${index}')}
    Click Element                                   ${homepage_img_button_item.format('${index}')}



