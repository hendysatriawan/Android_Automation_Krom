*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Keywords ***
User taps proceed to checkout button
    Tap Cart Icon
    Verify Cart Page Item is Displayed
    Tap Checkout Button
    User login with username "${valid_username}" and password "${valid_password}"

User should be redirect to shipping address form
    Verify Checkout Shipping Page Displayed

User navigates to checkout shipping page
    User has item in cart
    User taps proceed to checkout button
    Verify Checkout Shipping Page Displayed

User taps To Payment button
    Tap Checkout To Payment Button

Error on shipping form should be displayed
    Verify fullname is required error message displayed
    Verify address 1 is required error message displayed
    Verify city is required error message displayed
    Verify zipcode is required error message displayed
    Verify country is required error message displayed
    Verify Shipping Form Error Displayed

User navigates to payment page
    User navigates to checkout shipping page
    Input Shipping Form
    Tap Checkout To Payment Button
    Verify Checkout Payment Page Displayed

User taps Review order
    Tap To Review Order Button

Error on payment form should be displayed
    verify fullname payment is required error message displayed
    verify card number payment is required error message displayed
    verify expiry date payment is required error message displayed
    verify security code payment is required error message displayed
    