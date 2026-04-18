** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
#checkout payment
${checkout_payment_title}    id=${package}:id/enterPaymentTitleTV
${checkout_payment_subtitle}    id=${package}:id/enterPaymentMethodTV
${checkout_payment_text}    id=${package}:id/paymentDetailsTV
${checkout_payment_card_number_text}    id=${package}:id/cardTV
#form
${checkout_payment_fullname_text}    //android.widget.TextView[@resource-id="${package}:id/nameTV"][@text="Full Name*"]        
${checkout_payment_fullname_input}    id=${package}:id/nameET
${checkout_payment_fullname_input_error}    id=${package}:id/nameErrorIV
${checkout_payment_fullname_text_error}    id=${package}:id/nameErrorTV    # Value looks invalid.
${checkout_payment_card_number_text}    //android.widget.TextView[@resource-id="${package}:id/cardNumberTV"][@text="Card Number*"]
${checkout_payment_card_number_input}    id=${package}:id/cardNumberET
${checkout_payment_card_number_input_error}    id=${package}:id/cardNumberErrorIV    
${checkout_payment_expiry_date_text}    //android.widget.TextView[@resource-id="${package}:id/expirationDateTV"][@text="Expiration Date*"]
${checkout_payment_expiry_date_input}    id=${package}:id/expirationDateET
${checkout_payment_expiry_date_input_error}    id=${package}:id/expirationDateIV
${checkout_payment_expiry_date_text_error}    id=${package}:id/expirationDateErrorTV    # Value looks invalid.
${checkout_payment_security_code_text}    //android.widget.TextView[@resource-id="${package}:id/securityCodeTV"][@text="Security Code*"]
${checkout_payment_security_code_input}    id=${package}:id/securityCodeET
${checkout_payment_security_code_input_error}    id=${package}:id/securityCodeIV
${checkout_payment_security_code_text_error}    id=${package}:id/securityCodeErrorTV    # Value looks invalid.
${checkout_payment_confirmation_checkbox}    id=${package}:id/billingAddressCB
#button
${checkout_to_review_order_button}    id=${package}:id/paymentBtn

*** Keywords ***
Verify Checkout Payment Page Displayed
    Verify Header Menu Visible
    Wait Until Element Is Visible    ${checkout_payment_title}
    Wait Until Element Is Visible    ${checkout_payment_subtitle}
    Wait Until Element Is Visible    ${checkout_payment_text}
    Wait Until Element Is Visible    ${checkout_payment_card_number_text}
    Wait Until Element Is Visible    ${checkout_payment_fullname_text}
    Wait Until Element Is Visible    ${checkout_payment_fullname_input}
    Wait Until Element Is Visible    ${checkout_payment_card_number_text}
    Wait Until Element Is Visible    ${checkout_payment_card_number_input}
    Wait Until Element Is Visible    ${checkout_payment_expiry_date_text}
    Wait Until Element Is Visible    ${checkout_payment_expiry_date_input}
    Wait Until Element Is Visible    ${checkout_payment_security_code_text}
    Wait Until Element Is Visible    ${checkout_payment_security_code_input}
    Wait Until Element Is Visible    ${checkout_payment_confirmation_checkbox}
    Wait Until Element Is Visible    ${checkout_to_review_order_button}

Input Fullname Payment
    [Arguments]    ${fullname}
    Wait Until Element Is Visible    ${checkout_payment_fullname_input}
    Input Text    ${checkout_payment_fullname_input}    ${fullname}

Input Card Number Payment
    [Arguments]    ${card_number}
    Wait Until Element Is Visible    ${checkout_payment_card_number_input}
    Input Text    ${checkout_payment_card_number_input}    ${card_number}

Input Expiry Date Payment
    [Arguments]    ${expiry_date}
    Wait Until Element Is Visible    ${checkout_payment_expiry_date_input}
    Input Text    ${checkout_payment_expiry_date_input}    ${expiry_date}    

Input Security Code Payment
    [Arguments]    ${cvv}
    Wait Until Element Is Visible    ${checkout_payment_security_code_input}
    Input Text    ${checkout_payment_security_code_input}    ${cvv}

Tap Confirmation Checkbox Payment
    Wait Until Element Is Visible    ${checkout_payment_confirmation_checkbox}
    Click Element    ${checkout_payment_confirmation_checkbox}    

Tap To Review Order Button
    Wait Until Element Is Visible    ${checkout_to_review_order_button}
    Click Element    ${checkout_to_review_order_button}    

verify fullname payment is required error message displayed
    Wait Until Element Is Visible    ${checkout_payment_fullname_input_error}
    Wait Until Element Is Visible    ${checkout_payment_fullname_text_error}
    Element Text Should Be    ${checkout_payment_fullname_text_error}    Value looks invalid.

verify card number payment is required error message displayed
    Wait Until Element Is Visible    ${checkout_payment_card_number_input_error}

verify expiry date payment is required error message displayed
    Wait Until Element Is Visible    ${checkout_payment_expiry_date_input_error}
    Wait Until Element Is Visible    ${checkout_payment_expiry_date_text_error}
    Element Text Should Be    ${checkout_payment_expiry_date_text_error}    Value looks invalid.

verify security code payment is required error message displayed
    Wait Until Element Is Visible    ${checkout_payment_security_code_input_error}
    Wait Until Element Is Visible    ${checkout_payment_security_code_text_error}
    Element Text Should Be    ${checkout_payment_security_code_text_error}    Value looks invalid.    
