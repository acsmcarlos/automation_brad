*** Settings ***
Documentation    Suite de testes de login no Octane

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no Octane
    [Documentation]    Octane

    New Browser    chromium    headless=False    slowMo=00:00:00
    Set Browser Timeout    40 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    New Page    https://192.168.231.27:8443/authentication-point/web-ui-login.jsp

    Wait For Elements State    css=.alm-web-ui-login-container    visible    30


    Fill Text    id=inputUsername    ${CHAVE_M}
    Fill Text    id=inputPassword    ${SENHA}

    Click    css=button[type="submit"]

    Wait For Elements State    css=div[data-aid="main-menu"]    visible   30

    Sleep    4

