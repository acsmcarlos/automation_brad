*** Settings ***
Documentation    Teste

Library    Browser
# Library    SikuliLibrary
# Library    Zoomba.DesktopLibrary
# Library    Zoomba.GUILibrary

Resource    SendKeys.robot

*** Variables ***
${URL_BASE}    https://192.168.231.104:8443/TestDataManager/index.html


*** Keywords ***
Start Session
    New Browser    chromium    headless=False    slowMo=00:00:00
    Carregar os elementos

Close Session
    Close Browser

Carregar os elementos
    Add Image Path    ${EXECDIR}/Resources/Elements

Autenticar com o licenciador Usuario Devops
    [Arguments]    ${canal}

    New Page    https://sonarqube.bradesco.com.br:8443/devopsadmin/#/start-user

    Fill Text    id=formBasicMatricula    ${CHAVE_M}
    Fill Text    id=formBasicSenha        ${SENHA}

    Select Options By    id=formBasicSelect    value    ${canal}
    # bitbucket confluence jira

    Click    css=button[type=submit]

    Sleep     1