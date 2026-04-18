** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
#checkout shipping address
${checkout_title}    //android.widget.TextView[@resource-id="${package}:id/checkoutTitleTV"][@text="Checkout"]
${checkout_subtitle}    //android.widget.TextView[@resource-id="${package}:id/enterShippingAddressTV"][@text="Enter a shipping address"]
#form
${checkout_fullname_text}    //android.widget.TextView[@resource-id="${package}:id/fullNameTV"][@text="Full Name*"]
${checkout_fullname_input}    id=${package}:id/fullNameET
${checkout_fullname_input_error}     id=${package}:id/fullNameErrorIV  
${checkout_fullname_text_error}    id=${package}:id/fullNameErrorTV
${checkout_address_text_1}    //android.widget.TextView[@resource-id="${package}:id/address1TV"][@text="Address Line 1*"]
${checkout_address_input_1}    id=${package}:id/address1ET
${checkout_address_input_1_error}    id=${package}:id/address1ErrorIV    
${checkout_address_text_1_error}    id=${package}:id/address1ErrorTV
${checkout_address_text_2}    //android.widget.TextView[@resource-id="${package}:id/address2TV"][@text="Address Line 2"]
${checkout_address_input_2}    id=${package}:id/address2ET
${checkout_city_text}    //android.widget.TextView[@resource-id="${package}:id/cityTV"]
${checkout_city_input}   id=${package}:id/cityET
${checkout_city_input_error}    id=${package}:id/cityIV
${checkout_city_text_error}    id=${package}:id/cityErrorTV
${checkout_state_text}    //android.widget.TextView[@resource-id="${package}:id/stateTV"][@text="State/Region"]
${checkout_state_input}    id=${package}:id/stateET
${checkout_zipcode_text}    //android.widget.TextView[@resource-id="${package}:id/zipTV"][@text="Zip Code*"]
${checkout_zipcode_input}    id=${package}:id/zipET
${checkout_zipcode_input_error}    id=${package}:id/zipIV
${checkout_zipcode_text_error}    id=${package}:id/zipErrorTV
${checkout_country_text}    //android.widget.TextView[@resource-id="${package}:id/countryTV"][@text="Country*"]
${checkout_country_input}    id=${package}:id/countryET
${checkout_country_input_error}    id=${package}:id/countryIV
${checkout_country_text_error}    id=${package}:id/countryErrorTV
#button
${checkout_to_payment_button}    id=${package}:id/paymentBtn

*** Keywords ***
Verify Checkout Shipping Page Displayed
    Verify Header Menu Visible
    Wait Until Element Is Visible    ${checkout_title}
    Wait Until Element Is Visible    ${checkout_subtitle}
    Wait Until Element Is Visible    ${checkout_fullname_text}
    Wait Until Element Is Visible    ${checkout_fullname_input}
    Wait Until Element Is Visible    ${checkout_address_text_1}
    Wait Until Element Is Visible    ${checkout_address_input_1}
    Wait Until Element Is Visible    ${checkout_address_text_2}
    Wait Until Element Is Visible    ${checkout_address_input_2}
    Wait Until Element Is Visible    ${checkout_city_text}
    Wait Until Element Is Visible    ${checkout_city_input}
    Wait Until Element Is Visible    ${checkout_state_text}
    Wait Until Element Is Visible    ${checkout_state_input}
    Wait Until Element Is Visible    ${checkout_zipcode_text}
    Wait Until Element Is Visible    ${checkout_zipcode_input}
    Wait Until Element Is Visible    ${checkout_country_text}
    Wait Until Element Is Visible    ${checkout_country_input}
    Wait Until Element Is Visible    ${checkout_to_payment_button}

Input Fullname
    [Arguments]    ${fullname}
    Wait Until Element Is Visible    ${checkout_fullname_input}
    Input Text    ${checkout_fullname_input}    ${fullname}    

Input Address 1
    [Arguments]    ${address1}
    Wait Until Element Is Visible    ${checkout_address_input_1}
    Input Text    ${checkout_address_input_1}    ${address1}    

Input Address 2
    [Arguments]    ${address2}
    Wait Until Element Is Visible    ${checkout_address_input_2}
    Input Text    ${checkout_address_input_2}    ${address2}    

Input City
    [Arguments]    ${city}
    Wait Until Element Is Visible    ${checkout_city_input}
    Input Text    ${checkout_city_input}    ${city}    

Input State
    [Arguments]    ${state}
    Wait Until Element Is Visible    ${checkout_state_input}
    Input Text    ${checkout_state_input}    ${state}    

Input Zipcode
    [Arguments]    ${zipcode}
    Wait Until Element Is Visible    ${checkout_zipcode_input}
    Input Text    ${checkout_zipcode_input}    ${zipcode}    

Input Country
    [Arguments]    ${country}
    Wait Until Element Is Visible    ${checkout_country_input}
    Input Text    ${checkout_country_input}    ${country}

Tap Checkout To Payment Button
    Wait Until Element Is Visible    ${checkout_to_payment_button}
    Click Element    ${checkout_to_payment_button}    

Verify fullname is required error message displayed
    Wait Until Element Is Visible    ${checkout_fullname_input_error}
    Wait Until Element Is Visible    ${checkout_fullname_text_error}
    Element Text Should Be    ${checkout_fullname_text_error}    Please provide your full name.

Verify address 1 is required error message displayed
    Wait Until Element Is Visible    ${checkout_address_input_1_error}
    Wait Until Element Is Visible    ${checkout_address_text_1_error}
    Element Text Should Be    ${checkout_address_text_1_error}    Please provide your address.

Verify city is required error message displayed
    Wait Until Element Is Visible    ${checkout_city_input_error}
    Wait Until Element Is Visible    ${checkout_city_text_error}
    Element Text Should Be    ${checkout_city_text_error}    Please provide your city.

Verify zipcode is required error message displayed
    Wait Until Element Is Visible    ${checkout_zipcode_input_error}
    Wait Until Element Is Visible    ${checkout_zipcode_text_error}
    Element Text Should Be    ${checkout_zipcode_text_error}    Please provide your zip

Verify country is required error message displayed
    Wait Until Element Is Visible    ${checkout_country_input_error}
    Wait Until Element Is Visible    ${checkout_country_text_error}
    Element Text Should Be    ${checkout_country_text_error}    Please provide your

Verify Shipping Form Error Displayed
    Verify fullname is required error message displayed
    Verify address 1 is required error message displayed
    Verify city is required error message displayed
    Verify zipcode is required error message displayed
    Verify country is required error message displayed

Input Shipping Form
    Generate Shipping Form Data
    Input Fullname    ${faker_fullname}
    Input Address 1    ${faker_address1}
    Input Address 2    ${faker_address2}
    Input City    ${faker_city}
    Input State    ${faker_state}
    Input Zipcode    ${faker_zipcode}
    Input Country    ${faker_country}