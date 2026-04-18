** Settings ***
Resource    ${CURDIR}/../../resources/resources.robot

*** Variables ***
${package}    ${APP_package_android}    
# text
${Login_title}    //android.widget.TextView[@resource-id="${package}:id/loginTV"][@text="Login"]
${login_subtitle}    //android.widget.TextView[@resource-id="${package}:id/selectTextTV"][@text="Select a username and password from the list below, or click on the username to automatically populate the username and password."]

# input
${username_title}    //android.widget.TextView[@resource-id="${package}:id/usernameTV"][@text="Username"]
${password_title}    //android.widget.TextView[@resource-id="${package}:id/passwordTV"][@text="Password"]
${username_input}    id=${package}:id/nameET
${password_input}    id=${package}:id/passwordET

# button
${login_button}    id=${package}:id/loginBtn

# error message
${username_input_error}    id=${package}:id/usernameErrorIV
${password_input_error}    id=${package}:id/passwordErrorIV

${username_text_error}    id=${package}:id/nameErrorTV     # text error : "Username is required"
${password_text_error}    id=${package}:id/passwordErrorTV    # text error : "Enter Password"

*** Keywords ***
Verify Login Page Displayed
    Wait Until Element Is Visible    ${Login_title}
    Wait Until Element Is Visible    ${login_subtitle}
    Wait Until Element Is Visible    ${username_title}
    Wait Until Element Is Visible    ${password_title}
    Wait Until Element Is Visible    ${username_input}
    Wait Until Element Is Visible    ${password_input}
    Wait Until Element Is Visible    ${login_button}
    Verify Header Menu Visible

Input Username Login Page
    [Arguments]    ${username}    
    wait until element is visible    ${username_input}
    Input Text    ${username_input}    ${username}

Input Password Login Page
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_input}
    Input Text    ${password_input}    ${password}

Tap Login Button
    Wait Until Element Is Visible    ${login_button}
    Click Element    ${login_button}


Show error "${errormessage}" in Login Page
    IF    "${errormessage}" == "Username is required"
        Wait Until Element Is Visible    ${username_input_error}
        Wait Until Element Is Visible    ${username_text_error}
        Element Text Should Be    ${username_text_error}    ${errormessage}
    ELSE IF    "${errormessage}" == "Enter Password"
        Wait Until Element Is Visible    ${password_input_error}
        Wait Until Element Is Visible    ${password_text_error}
        Element Text Should Be    ${password_text_error}    ${errormessage}
    END
