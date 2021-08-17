#language: pt

@criar_usuario
Funcionalidade: Criando um novo usuario
    @criar_usuario_sucesso
    Cenario: validar que criei um usuario com sucesso
        Dado que crio um usuario
        Então valido a resposta usuario criado com sucesso

    @criar_usuario_erro
    Cenario: validar que usuario não cadastrado por email invalido
        Dado tento criar um usuario sem um email invalido
        Então valido a resposta de falta informacao

    @ususario_cadastrado
    Cenario: validar que o usuario já esta cadastrado
        Dado que tento cadastrar um usuario já cadastrado
        Então valido a resposta de usuario já cadastrado
        
