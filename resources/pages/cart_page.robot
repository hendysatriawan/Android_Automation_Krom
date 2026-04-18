** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
${cart_title}    //android.widget.TextView[@resource-id="${package}:id/productTV"]
${cart_product_image}    id=${package}:id/productIV
${cart_product_ratings}    id=${package}:id/rattingV
${cart_product_remove_button}    //android.widget.TextView[@content-desc="Removes product from cart"]
${cart_product_add_qty_button}    id=${package}:id/plusIV
${cart_product_remove_qty_button}    id=${package}:id/minusIV
${cart_product_qty_text}    id=${package}:id/noTV
${cart_checkout_button}    id=${package}:id/cartBt
${cart_total_price_text}    //android.widget.TextView[@resource-id="${package}:id/totalPriceTV"]
${cart_total_item_text}    //android.widget.TextView[@resource-id="${package}:id/itemsTV"]

#cart empty
${cart_empty_title}    //android.widget.TextView[@resource-id="${package}:id/noItemTitleTV"]
${cart_empty_image}    id=${package}:id/cartInfoLL
${cart_empty_subtitle}    //android.widget.TextView[@text="Oh no! Your cart is empty. Fill it up with swag to complete your purchase."]
${cart_empty_go_shopping_button}    id=${package}:id/shoppingBt

*** Keywords ***
Verify Cart Page Item is Displayed
    Verify Header Menu Visible
    Wait Until Element Is Visible    ${cart_title}
    ${cart_product_title}    Build Text Locator    titleTV    ${item_name}
    ${cart_product_price}    Build Text Locator    priceTV    ${item_price}
    Wait Until Element Is Visible    ${cart_product_title}
    Wait Until Element Is Visible    ${cart_product_price}
    Wait Until Element Is Visible    ${cart_product_image}
    Wait Until Element Is Visible    ${cart_product_ratings}
    Wait Until Element Is Visible    ${cart_product_remove_button}
    Wait Until Element Is Visible    ${cart_product_add_qty_button}
    Wait Until Element Is Visible    ${cart_product_remove_qty_button}
    Wait Until Element Is Visible    ${cart_product_qty_text}
    Wait Until Element Is Visible    ${cart_checkout_button}
    Wait Until Element Is Visible    ${cart_total_price_text}
    Wait Until Element Is Visible    ${cart_total_item_text}
    
Verify Cart Page Item is Empty
    Verify Header Menu Visible
    Wait Until Element Is Visible    ${cart_empty_title}
    Wait Until Element Is Visible    ${cart_empty_image}
    Wait Until Element Is Visible    ${cart_empty_subtitle}
    Wait Until Element Is Visible    ${cart_empty_go_shopping_button}

Tap Remove Product From Cart
    Wait Until Element Is Visible    ${cart_product_remove_button}
    Click Element    ${cart_product_remove_button}

Tap Add Quantity Button from Cart
    Wait Until Element Is Visible    ${cart_product_add_qty_button}
    Click Element    ${cart_product_add_qty_button}

Tap Remove Quantity Button from Cart
    Wait Until Element Is Visible    ${cart_product_remove_qty_button}
    Click Element    ${cart_product_remove_qty_button}

Tap Remove Product From Cart Until Empty
    ${qty}    Get Text    ${cart_product_qty_text}
    ${qty}    Convert To Integer    ${qty}
    FOR    ${index}    IN RANGE    0    ${qty}
        Tap Remove Quantity Button
    END

Tap Checkout Button
    Wait Until Element Is Visible    ${cart_checkout_button}
    Click Element    ${cart_checkout_button}