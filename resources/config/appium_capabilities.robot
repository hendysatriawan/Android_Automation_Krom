*** Settings ***
Resource    ../resources.robot

*** Keywords ***
Open apps
    [Arguments]    &{device_capabilities}
    &{capabilities}=    Create Dictionary
    ...    platformName=Android    
    ...    automationName=UiAutomator2    
    ...    appPackage=${APP_package_android}
    ...    appActivity=${APP_activity_android}   
    ...    noReset=false    
    ...    fullReset=false   
    ...    newCommandTimeout=300
    Set To Dictionary    ${capabilities}    &{device_capabilities}
    Open Application    ${appium_server}    &{capabilities}
    
Open Application to Device
    Open apps    &{emulator-554}
    Verify Header Menu Visible

Test Finished
    Run Keyword If Test Failed    Capture Page Screenshot
    Close Application