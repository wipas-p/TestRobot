*** Settings ***
Library    Selenium2Library    

*** Variables *** ***
${BROWSER}    Chrome
${SERVER}    https://vsoc.mooo.com:1981/console/app.showApp.cmd
${DELAY}    0.5
${TARGET1}    PoolStats 

*** Keywords ***
Open Browser to Search
    Open Browser    ${SERVER}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot    1-OpenBrowser.png
    
FillSearch
    Input Text  id=j_username  xxxxx
    Input Text  id=j_password  xxxxxx
    Capture Page Screenshot    2-FillLogin.png

PushLogin
    Click Button    id=buttonWithJavascript  
    Capture Page Screenshot    3-ClickLogin.png
    
CLickPolicies
    Wait Until Page Contains  Policies
    Capture Page Screenshot  4-Policies.png
    Click Element  xpath://a[contains(text(),'Policies')]
    Capture Page Screenshot    5-ClickPolicies.png 

ClickLogout
    Click Element  xpath://a[@class='ico-logout']
    Capture Page Screenshot  7-ClickLogout.png

*** Test Cases ***

Open WebBrowser
    Open Browser to Search
    FillSearch
    PushLogin
    CLickPolicies
    [Teardown]    Close Browser
