*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot
Test Setup    Open Application to Device
Test Teardown    Test Finished

*** Test Cases ***
Remove item from cart and cart badge is updated
    [Documentation]    Test case untuk memverifikasi bahwa pengguna dapat menghapus item dari keranjang dan badge keranjang diperbarui.
    [Tags]    TC_POS_CART_01    Cart    Positive
    Given User has item in cart
    When User taps remove item button in cart
    Then cart should be empty

setting item quantity to 0 removes item from cart
    [Documentation]    Test case untuk memverifikasi bahwa mengatur jumlah item menjadi 0 akan menghapus item dari keranjang.
    [Tags]    TC_POS_CART_02    Cart    Positive
    Given User has item in cart
    When User set quantity to 0
    Then cart should be empty