*** Settings ***
Documentation    Suite de testes de login do adm

Library     Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no Confluence
    [Documentation]    Confluence

    New Browser            chromium      headless=False    slowMo=00:00:00
    Set Browser Timeout    40 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    Autenticar com o licenciador Usuario Devops    confluence

    New Page    https://confluence.bradesco.com.br:8443/login.action?logout=true

    Wait For Elements State    css=h2 >> text=Autenticação    visible    15

    Fill Text    id=os_username    ${CHAVE_M}
    Fill Text    id=os_password    ${SENHA}

    Click    id=loginButton

    Wait For Elements State    css=span[class="aui-header-logo-text"] >> text=Confluence    visible    30

    Sleep    4





