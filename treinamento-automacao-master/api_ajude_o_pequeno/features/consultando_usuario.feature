#language: pt

@consulta_usuario
Funcionalidade: validando consulta de usuario cadastrado

    @consulta_cadastrado
    Cenario: validar consulta de usuario cadastrado 
        Dado que consulto um usuario cadastrado
        Então valido que foi retornado o cadastro do usuario

    @consulta_nao_cadastrado
    Cenario: validar que usuario não está cadastrado
        Dado que consulto um usuario não cadatrado
        Então valido que foi retornado que usuario não existente