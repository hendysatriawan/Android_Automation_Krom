** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
# menu
${burger_menu}    id=${package}:id/menuIV
${menu_item_login}    //android.widget.TextView[@resource-id="${package}:id/itemTV"][@text="Log In"]
${menu_item_catalog}    //android.widget.TextView[@resource-id="${package}:id/itemTV"][@text="Catalog"]
${menu_item_logout}    //android.widget.TextView[@resource-id="${package}:id/itemTV"][@text="Log Out"]

# cart
${cart_icon}    id=${package}:id/cartIV

*** Keywords ***
Tap Burger Menu
    Wait Until Keyword Succeeds    5x    1s    Wait Until Element Is Visible    ${burger_menu}
    Click Element    ${burger_menu}

Verify "${Menu}" Menu Visible
    ${locator}    Set Variable If    
    ...    '${Menu}' == 'Login'    ${menu_item_login}
    ...    '${Menu}' == 'Catalog'    ${menu_item_catalog}
    ...    '${Menu}' == 'Logout'    ${menu_item_logout}
    Wait Until Element Is Visible    ${locator}

Tap Login Menu Item
    Click Element    ${menu_item_login}

Tap Catalog Menu Item
    Click Element    ${menu_item_catalog}

Tap Logout Menu Item
    Click Element    ${menu_item_logout}

Verify Cart Icon Visible
    Wait Until Keyword Succeeds    5x    1s    Wait Until Element Is Visible    ${cart_icon}

Verify Header Menu Visible
    Wait Until Keyword Succeeds    5x    1s    Wait Until Element Is Visible    ${burger_menu}    
    Verify Cart Icon Visible

Tap Cart Icon
    Wait Until Element Is Visible    ${cart_icon}
    Click Element    ${cart_icon}

Build Text Locator
    [Arguments]    ${resource_id}    ${text}
    ${locator}=    Set Variable    //android.widget.TextView[@resource-id="${package}:id/${resource_id}"][contains(@text, "${text}")]
    RETURN    ${locator}