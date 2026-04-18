Feature: Checkout

@TC_POS_CHECKOUT_01 @Checkout @Positive
Scenario: Checkout item from cart
    Given User has item in cart
    When User clicks proceed to checkout button
    Then User should be redirect to shipping address form

@TC_NEG_CHECKOUT_01 @Checkout @Negative
Scenario: Proceed to payment without filling shipping form shows error
    Given User navigates to checkout shipping page
    When User clicks To Payment button
    Then Error on shipping form should be displayed

@TC_NEG_CHECKOUT_02 @Checkout @Negative
Scenario: Proceed payment without filling payment form shows error
    Given User navigates to payment page
    When User clicks Review order
    Then Error on payment form should be displayed