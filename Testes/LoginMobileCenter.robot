*** Settings ***
Documentation    Suite de testes de login no Mobile Center

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no Mobile Center
    [Documentation]    Mobile Center

    New Browser            chromium      headless=False    slowMo=00:00:00    timeout=20s

    Set Browser Timeout    50 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    New Page    https://mobilecenter.net.bradesco.com.br/integration/#/login

    Wait For Elements State    css=.login-box    visible    60

    Fill Text    css=input[type="text"]        ${CHAVE_M}
    Fill Text    css=input[type="password"]    ${SENHA}

    Click    css=span[ng-hide="loggingIn"]

    Wait For Elements State    id=navbar    visible    60

    Sleep    10

