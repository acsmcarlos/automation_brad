*** Settings ***
Documentation    Suite de testes de login do TDM

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no TDM
    [Documentation]    TDM

    New Browser    chromium    headless=False    slowMo=00:00:00
    
    Set Browser Timeout    40 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    New Page    https://192.168.231.104:8443/TestDataManager/index.html

    Wait For Elements State    css=.loginHeading >> text=Test Data Manager Portal    visible    15
    
    Fill Text    id=username    ${CHAVE_M}
    Fill Text    id=password    ${SENHA}

    Click    id=btn_submit_login

    Wait For Elements State    css=p[class^=tdm-h1-label] >> text=Welcome to CA Test Data Manager    visible    30

    Sleep    4

