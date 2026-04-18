** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
# ${catalog_details_title}    //android.widget.TextView[@resource-id="${package}:id/productTV"][@text="${item_name}"]
# ${catalog_details_price}    //android.widget.TextView[@resource-id="${package}:id/priceTV"][@text="${item_price}"]
${catalog_details_image}    id=${package}:id/productIV
${catalog_details_description_title}    id=${package}:id/productHeightLightsTV
${catalog_details_description_text}    id=${package}:id/descTV
${catalog_details_ratings}    id=${package}:id/rattingV
${catalog_details_add_to_cart_button}    id=${package}:id/cartBt
${catalog_details_add_qty_button}    id=${package}:id/plusIV
${catalog_details_remove_qty_button}    id=${package}:id/minusIV
${catalog_details_qty_text}    id=${package}:id/noTV
#cart
${cart_qty}    //android.widget.TextView[@resource-id="${package}:id/cartTV"]
*** Keywords ***
Verify Catalog Details Page Displayed
    Verify Header Menu Visible
    ${catalog_details_title}    Build Text Locator    productTV    ${item_name}
    ${catalog_details_price}    Build Text Locator    priceTV    ${item_price}
    Wait Until Element Is Visible    ${catalog_details_title}
    Wait Until Element Is Visible    ${catalog_details_price}
    Wait Until Element Is Visible    ${catalog_details_image}
    Wait Until Element Is Visible    ${catalog_details_description_title}
    Wait Until Element Is Visible    ${catalog_details_description_text}
    Wait Until Element Is Visible    ${catalog_details_ratings}
    Wait Until Element Is Visible    ${catalog_details_add_to_cart_button}
    Wait Until Element Is Visible    ${catalog_details_add_qty_button}
    Wait Until Element Is Visible    ${catalog_details_remove_qty_button}
    Wait Until Element Is Visible    ${catalog_details_qty_text}

Tap Add To Cart Button
    #get text qty sebelum add to cart
    Wait Until Element Is Visible    ${catalog_details_qty_text}
    Get Qty in Cart
    ${qty_tocart}    Get Text    ${catalog_details_qty_text}
    Set Global Variable    ${qty_tocart}
    Wait Until Element Is Visible    ${catalog_details_add_to_cart_button}
    Click Element    ${catalog_details_add_to_cart_button}

Get Qty in Cart
    ${cek_element}    Run Keyword And Return Status   Wait Until Element Is Visible    ${cart_qty}
    IF    '${cek_element}'=='True'
        Wait Until Element Is Visible    ${cart_qty}
        ${qty}    Get Text    ${cart_qty}
        Set Test Variable    ${qty}
    ELSE
        Set Test Variable    ${qty}    0
    END

Tap Add Quantity Button
    Wait Until Element Is Visible    ${catalog_details_add_qty_button}
    Click Element    ${catalog_details_add_qty_button}

Tap Remove Quantity Button
    Wait Until Element Is Visible    ${catalog_details_remove_qty_button}
    Click Element    ${catalog_details_remove_qty_button}

Sum of qty
    #cek qty di cart
    ${total_qty}    Evaluate    ${qty} + ${qty_tocart}
    ${total_qty}    Convert To String    ${total_qty}
    RETURN    ${total_qty}

Verify qty in cart
    ${total_qty}    Sum of qty    
    Log    ${total_qty}
    Element Should Contain Text    ${cart_qty}    ${total_qty}