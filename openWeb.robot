*** Settings ***
Library    Selenium2Library    


*** Variables *** ***
${BROWSER}    Chrome
${SERVER}    http://kong-default.apps.45.116.216.107.xip.io/
${DELAY}    0.5
${TARGET1}    PoolStats 


*** Variables ***
${URL}  http://kong-default.apps.45.116.216.107.xip.io/


*** Test Cases ***
Test Case
    Open Browser    ${SERVER}  ${BROWSER}
    Click Element    xpath://*[contains(text(),"${TARGET1}")]    
    [Teardown]    Close Browser
