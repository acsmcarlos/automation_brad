*** Settings ***
Documentation    Suite de testes de login do Nexus

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no Nexus
    [Documentation]    Nexus

    New Browser    chromium    headless=False    slowMo=00:00:00
    
    Set Browser Timeout    10 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    New Page    https://nexusrepository.bradesco.com.br:8443

    Wait For Elements State    id=label-1149 >> text=Welcome    visible    5

    Click     id=nx-header-signin-1143-btnInnerEl

    Wait For Elements State   id=ext-element-17    visible    5

    Fill Text    css=input[name=username]    ${CHAVE_M}
    Fill Text    css=input[name=password]    ${SENHA}

    Click    xpath=//span[@class="x-btn-inner x-btn-inner-nx-primary-small"][text()="Sign in"]

    Wait For Elements State   id=button-1142-btnInnerEl >> text=M280358    visible    5

    Sleep    4

