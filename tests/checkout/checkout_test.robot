*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot
Test Setup    Open Application to Device
Test Teardown    Test Finished

*** Test Cases ***
Checkout item from cart
    [Documentation]    Test case untuk memverifikasi bahwa pengguna dapat melakukan checkout item dari keranjang.
    [Tags]    TC_POS_CHECKOUT_01    Checkout    Positive
    Given User has item in cart
    When User taps proceed to checkout button
    Then User should be redirect to shipping address form

Proceed to payment without filling shipping form shows error
    [Documentation]    Test case untuk memverifikasi bahwa pengguna tidak dapat melanjutkan ke pembayaran tanpa mengisi formulir alamat pengiriman dan menampilkan pesan error.
    [Tags]    TC_NEG_CHECKOUT_01    Checkout    Negative
    Given User navigates to checkout shipping page
    When User taps To Payment button
    Then Error on shipping form should be displayed

Proceed payment without filling payment form shows error
    [Documentation]    Test case untuk memverifikasi bahwa pengguna tidak dapat menyelasaikan pembayaran tanpa mengisi formulir pembayaran dan menampilkan pesan error.
    [Tags]    TC_NEG_CHECKOUT_02    Checkout    Negative
    Given User navigates to payment page
    When User taps Review order
    Then Error on payment form should be displayed