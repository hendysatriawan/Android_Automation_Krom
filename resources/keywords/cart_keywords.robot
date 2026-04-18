*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Keywords ***
User has item in cart
    User is on product details page
    User adds item to cart

User taps remove item button in cart    
    Tap Cart Icon
    Verify Cart Page Item is Displayed
    Tap Remove Product From Cart

cart should be empty
    Verify Cart Page Item is Empty

User set quantity to 0
    Tap Cart Icon
    Verify Cart Page Item is Displayed
    Tap Remove Product From Cart Until Empty