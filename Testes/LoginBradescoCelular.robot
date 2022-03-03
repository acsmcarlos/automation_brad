*** Settings ***
Documentation    Suite de testes de login no Bradesco Celular

Resource    ../Resources/Base.robot

# Suite Setup       Start Session
# Suite Teardown    Close Session

*** Test Cases ***
Login de Usuário no Bradesco Celular TU
    [Documentation]    Bradesco Celular TU

    New Browser    chromium    headless=False    slowMo=00:00:00

    Set Browser Timeout    60 seconds

    New Context    ignoreHTTPSErrors=${True}    bypassCSP=${True}

    New Page    https://www.m2.tu.teste.internet/mobilev2/android/Login.do

    Get Title    equal    Bradesco Celular

    Wait For Elements State    css=p[class="text-first"] >> text=Este App foi descontinuado    visible    5

    Execute Javascript    modalMigracao.close('modalMigracaoAppDescontinuadoLogin')

    Fill Text    id=agn       3994
    Fill Text    id=ctaDig    39149

    Select Options By    id=tit    text    1° Titular

    Fill Text    id=senha    7225

    Click     id=OK

    Wait For Elements State    css=p >> text=DIGITO INVÁLIDO.    visible    5


    Sleep    4

