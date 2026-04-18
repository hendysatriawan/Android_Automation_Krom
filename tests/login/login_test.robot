*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot
Test Setup    Open Application to Device
Test Teardown    Close Application 

*** Test Cases ***
 User Successful Login
    [Documentation]    Test case untuk memverifikasi bahwa pengguna dapat login dengan kredensial yang benar.
    [Tags]    TC_POS_LOGIN_01    Login    Positive
    Given User opens login page
    When User login with username "${valid_username}" and password "${valid_password}"
    Then Logout menu should be visible

Login fails when password is empty and error is shown
    [Documentation]    Test case untuk memverifikasi bahwa login gagal ketika password kosong dan menampilkan pesan error.
    [Tags]    TC_NEG_LOGIN_01    Login    Negative
    Given User opens login page
    When User login with username "${valid_username}" and password ""
    Then Show error "Enter Password" in Login Page

Login fails when username is empty and error is shown
    [Documentation]    Test case untuk memverifikasi bahwa login gagal ketika username kosong dan menampilkan pesan error.
    [Tags]    TC_NEG_LOGIN_02    Login    Negative
    Given User opens login page
    When User login with username "" and password "${valid_password}"
    Then Show error "Username is required" in Login Page

Login fails when username and password are empty and error is shown
    [Documentation]    Test case untuk memverifikasi bahwa login gagal ketika username dan password kosong dan menampilkan pesan error.
    [Tags]    TC_NEG_LOGIN_03    Login    Negative
    Given User opens login page
    When User login with username "" and password ""
    Then Show error "Username is required" in Login Page