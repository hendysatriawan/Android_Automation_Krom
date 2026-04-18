*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot
Test Setup    Open Application to Device
Test Teardown    Test Finished

*** Test Cases ***
Add item to cart and cart badge is updated
    [Documentation]    Test case untuk memverifikasi bahwa pengguna dapat menambahkan item ke keranjang dan badge keranjang diperbarui.
    [Tags]    TC_POS_CATALOG_01    Catalog    Positive
    Given User is on product details page
    When User adds item to cart
    Then The cart icon badge should be updated
