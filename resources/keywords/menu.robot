*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Keywords ***
Go To Login Page
    Tap Burger Menu
    Verify "Login" Menu Visible
    Tap Login Menu Item

Go To Catalog Page
    Tap Burger Menu
    Verify "Catalog" Menu Visible
    Tap Catalog Menu Item

Logout menu should be visible
    Tap Burger Menu
    Verify "Logout" Menu Visible
    