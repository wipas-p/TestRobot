*** Settings ***
Library    Selenium2Library    


*** Variables *** ***
${BROWSER}    Chrome
${SERVER}    http://www.google.com
${DELAY}    0.5

*** Keywords ***
Open Browser to Search
    Open Browser    ${SERVER}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  ${DELAY}
    Capture Page Screenshot    1-OpenBrowser.png
    
FillSearch
    Input Text  name:q  selenium
    Capture Page Screenshot    2-FillSearch.png

PushSearch
    Click Button    name:btnK  
    Capture Page Screenshot    3-ClickSearch.png
    
GotoTarget
    Wait Until Page Contains    Cypress      
    Click Element    xpath://*[contains(text(),"Cypress: Web Test Framework")]    
    Capture Page Screenshot    4-SearchResult.png
    
VerifyTarget
    Wait Until Page Contains    Development
    Capture Page Screenshot    5-Verify.png    

*** Test Cases ***

Open WebBrowser
    Open Browser to Search
    FillSearch
    PushSearch
    GotoTarget
    VerifyTarget
    [Teardown]    Close Browser
