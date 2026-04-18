*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Keywords ***
User is on product details page
    Go To Catalog Page
    Verify Catalog Page Displayed
    Tap Item Catalog

User adds item to cart
    Verify Catalog Details Page Displayed
    Tap Add To Cart Button

The cart icon badge should be updated
    Verify qty in cart