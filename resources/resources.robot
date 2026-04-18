*** Settings ***
# config
Resource    config/appium_capabilities.robot
Resource    config/libraries.robot
Resource    config/data.robot

# keywords
Resource    keywords/login_keywords.robot
Resource    keywords/catalog_keywords.robot
Resource    keywords/cart_keywords.robot
Resource    keywords/checkout_keywords.robot
Resource    keywords/menu.robot

# pages
Resource    pages/login_page.robot
Resource    pages/catalog_lists_page.robot
Resource    pages/catalog_details_page.robot
Resource    pages/cart_page.robot
Resource    pages/checkout_shipping_page.robot
Resource    pages/checkout_payment_page.robot
Resource    pages/common_page.robot
