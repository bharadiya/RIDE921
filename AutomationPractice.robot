*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.saucedemo.com    # URL Value
@{creds}          standard_user    secret_sauce
&{credsDict}      username=visual_user    password=secret_sauce

*** Test Cases ***
Testcase1
    [Tags]    smoke
    openBrowserAndMaximizeWindow
    Set Selenium Speed    1
    doLogin
    Go To    ${URL}/logout
    Log To Console    "Login and Logout functionality check is successful"
    Close All Browsers

Testcase2
    [Tags]    sanity
    FOR    ${i}    IN RANGE    0    11
        Log To Console    ${i}
    END
    ${isTrue}    Set Variable    False
    IF    ${isTrue}
        Log To Console    ${isTrue}
    ELSE
        Log To Console    ${isTrue}
    END
    Log To Console

Testcase3
    [Tags]    regression
    Open Browser    https://google.com    Chrome
    ${titleGoogle}    Get Title
    Log    ${titleGoogle}
    ${currentTitle}    Set Variable    Googl
    Should Be Equal As Strings    ${titleGoogle}    ${currentTitle}

LearnSetUpTearDown
    [Tags]    setupandTearDown
    [Setup]    openBrowserAndMaximizeWindow
    doLogin
    [Teardown]    Close All Browsers

LearnWithParams
    [Tags]    params
    OpenURLwithParams    Edge

*** Keywords ***
openBrowserAndMaximizeWindow
    Open Browser    ${URL}    chrome
    Maximize Browser Window

doLogin
    Input Text    //input[@id='user-name']    ${credsDict}[username]
    Input Password    //input[@id='password']    ${credsDict}[password]
    Click Button    //input[@id='login-button']
    Click Button    //button[@id='react-burger-menu-btn']

OpenURLwithParams
    [Arguments]    ${browser}
    Open Browser    ${URL}    ${browser}
