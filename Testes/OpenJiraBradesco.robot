*** Settings ***
Documentation    Suite de testes de login do Jira

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário Jira Bradesco
    [Documentation]    Jira

    New Browser    chromium    headless=False    slowMo=00:00:00
    Set Browser Timeout    40 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    Autenticar com o licenciador Usuario Devops    jira

    New Page    https://jira.bradesco.com.br:8443/secure/Dashboard.jspa

    Wait For Elements State    css=h1 >> text=System Dashboard    visible    15

    Fill Text    id=login-form-username    ${CHAVE_M}
    Fill Text    id=login-form-password    ${SENHA}

    Click    id=login

    Wait For Elements State    css=ul[class="aui-nav"][style="width: auto;"]     visible    30

    Sleep    10

