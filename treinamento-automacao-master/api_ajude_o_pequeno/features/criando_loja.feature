#language: pt

@criando_loja
Funcionalidade: validando criacao de uma loja

    @criar_loja
    Cenario: validar a criacao de uma loja
        Dado que crio um usuario
        E crio uma loja
        Então valido a resposta loja criada com sucesso

    @criar_loja_erro
    Cenario: validar que tento criar loja faltando informaco
        Dado tento criar uma loja faltando informações
        Então valido a resposta de não foi possivel criar a loja