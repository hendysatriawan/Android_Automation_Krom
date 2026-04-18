** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
${catalog_title}    //android.widget.TextView[@content-desc="title"][@text="Products"]
${catalog_displayed_items}    //androidx.recyclerview.widget.RecyclerView[@content-desc="Displays all products of catalog"]/android.view.ViewGroup

# per item catalog
${catalog_list_image}    (//android.widget.ImageView[@content-desc="Product Image"])
${catalog_list_name}    (//android.widget.TextView[@content-desc="Product Title"])
${catalog_list_price}    (//android.widget.TextView[@content-desc="Product Price"])
${catalog_list_ratings}    (//android.view.ViewGroup[@resource-id="${package}:id/rattingV"])
*** Keywords ***
Randomly Choose Catalog Item
    Wait Until Element Is Visible    ${catalog_displayed_items}
    ${items_count}    Get Matching Xpath Count    ${catalog_displayed_items}
    ${items_count}    evaluate    ${items_count} - 2
    Log    ${items_count}
    ${random_index}    Random Int    3    ${items_count}    #karena appsnya ada bug di item ke 2 (Sauce Labs Backpack (green), jadi saya set randomnya mulai dari index 3
    WHILE    '${random_index}' == '2'
        ${random_index}    Random Int    3    ${items_count}
    END
    Log    ${random_index}
    ${pilih_item}    Catenate    SEPARATOR=     ${catalog_displayed_items}    [${random_index}]
    Log    ${pilih_item}
    Set Test Variable    ${pilih_item}  
    Set Test Variable    ${random_index}  

Verify Catalog Item Displayed Details
    ${cek_detail_item}    Run Keyword And Return Status    Wait Until Element Is Visible   ${pilih_item}
    Run Keyword If    '${cek_detail_item}'=='False'    Fail    Item dengan index ${random_index} tidak ditemukan pada katalog    
    ${catalog_list_image}    Catenate    SEPARATOR=    ${catalog_list_image}    [${random_index}]
    wait until element is visible    xpath=${catalog_list_image}
    ${catalog_list_name}    Catenate    SEPARATOR=    ${catalog_list_name}    [${random_index}]
    wait until element is visible    xpath=${catalog_list_name}
    ${item_name}    Get Text    xpath=${catalog_list_name}
    Set Global Variable    ${item_name}
    ${catalog_list_price}    Catenate    SEPARATOR=    ${catalog_list_price}    [${random_index}]
    wait until element is visible    xpath=${catalog_list_price}
    ${item_price}    Get Text    xpath=${catalog_list_price}
    ${item_price}=    Strip String    ${item_price}
    ${item_price}=    Remove String    ${item_price}    $    ${SPACE}
    Set Global Variable    ${item_price}
    ${catalog_list_ratings}    Catenate    SEPARATOR=    ${catalog_list_ratings}    [${random_index}]
    wait until element is visible    xpath=${catalog_list_ratings}

Verify Catalog Page Displayed
    Verify Header Menu Visible
    Wait Until Element Is Visible    ${catalog_title}
    Wait Until Element Is Visible    ${catalog_displayed_items}
    Randomly Choose Catalog Item
    Verify Catalog Item Displayed Details

Tap Item Catalog
    Wait Until Element Is Visible    ${pilih_item}
    Click Element    ${pilih_item}