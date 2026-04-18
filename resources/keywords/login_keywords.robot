*** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Keywords ***
User opens login page
    Go To Login Page
    Verify Login Page Displayed

User login with username "${username}" and password "${password}"
    Input Username Login Page    ${username}
    Input Password Login Page    ${password}
    Tap Login Button        

