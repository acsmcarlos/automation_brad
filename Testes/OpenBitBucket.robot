*** Settings ***
Documentation    Suite de testes de login do BitBucket

Library       Browser
Resource    ../Resources/Base.robot

# Test Setup       Start Session
# Test Teardown    Close Session

*** Test Cases ***
Login de Usuário no BitBucket
    [Documentation]    BitBucket

    New Browser    chromium    headless=False    slowMo=00:00:00
    Set Browser Timeout    40 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    Autenticar com o licenciador Usuario Devops    bitbucket

    # New Page    https://bitbucket.bradesco.com.br:8443/login
    New Page    https://bitbucket.bradesco.com.br:8443/projects/CERTS/repos/gccs-srv-automacao-brain-multicanal/browse

    Wait For Elements State    css=section[class="aui-page-panel-content"]    visible    15


    Fill Text    id=j_username    ${CHAVE_M}
    Fill Text    id=j_password    ${SENHA}

    Click    id=_atl_remember_me
    Click    id=submit
    
    Wait For Elements State    css=span[class=stub]    visible    15

    Sleep    5

