*** Settings ***
Resource    appium_capabilities.robot
*** Variables ***
# appium server
${appium_server}    http://localhost:4723
${APP_package_android}    com.saucelabs.mydemoapp.android
${APP_activity_android}    com.saucelabs.mydemoapp.android.view.activities.SplashActivity

# emulator capabilities
&{emulator-554}
...    deviceName=emulator-5554    
...    platformVersion=13


# login page
${valid_username}    user1
${valid_password}    pass1

*** Keywords ***
Generate Shipping Form Data
    ${faker_fullname}    First Name    
    Set Global Variable    ${faker_fullname}
    ${faker_address1}    Address
    Set Global Variable    ${faker_address1}
    ${faker_address2}    Secondary Address
    Set Global Variable    ${faker_address2}
    ${faker_city}    City
    Set Global Variable    ${faker_city}
    ${faker_state}    State
    Set Global Variable    ${faker_state}
    ${faker_zipcode}    Zip Code
    Set Global Variable    ${faker_zipcode}
    ${faker_country}    Country
    Set Global Variable    ${faker_country}