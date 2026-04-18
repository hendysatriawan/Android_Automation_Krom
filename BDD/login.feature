Feature: Login

@TC_POS_LOGIN_01 @Login @Positive
Scenario: User Successful Login
    Given User opens login page
    When User login with username "user1" and password "pass1"
    Then Logout menu should be visible

@TC_NEG_LOGIN_01 @Login @Negative
Scenario: Login fails when password is empty and error is shown
    Given User opens login page
    When User login with username "user1" and password ""
    Then Show error "Enter Password" in Login Page

@TC_NEG_LOGIN_02 @Login @Negative
Scenario: Login fails when username is empty and error is shown
    Given User opens login page
    When User login with username "" and password "pass1"
    Then Show error "Username is required" in Login Page

@TC_NEG_LOGIN_03 @Login @Negative
Scenario: Login fails when username and password are empty and error is shown
    Given User opens login page
    When User login with username "" and password ""
    Then Show error "Username is required" in Login Page