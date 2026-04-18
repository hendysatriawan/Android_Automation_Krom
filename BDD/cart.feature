Feature: Cart

@TC_POS_CART_01 @Cart @Positive
Scenario: Remove item from cart and cart badge is updated
    Given User has item in cart
    When User clicks remove item button in cart
    Then cart should be empty

@TC_POS_CART_02 @Cart @Positive
Scenario: Setting item quantity to 0 removes item from cart
    Given User has item in cart
    When User set quantity to 0
    Then cart should be empty