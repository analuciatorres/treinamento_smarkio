# language: pt
# encode: UTF-8
@inicio
Funcionalidade: Realizar os testes de primeiro contato com usuário, relacionado a arvore de inicio.

@inicio_1
Cenario: validar o cenario de selecionar parcerias, receber o email de contato com sucesso

    Dado que entrei no chatbot
    Quando selecionar a opção 'Parcerias'
    Então valido apresentar um email de contato

@inicio_2
Cenario: Validar a transferencia para cadastro de usuario, ao selecionar a opcao sobre meu negocio

    Dado que entrei no chatbot
    E selecionar a opção 'Sobre meu negócio'
    Quando seleciono a opcao de 'Cadastrar minha empresa' na pergunta o que deseja fazer
    Então valido que fui direcionado para o fluxo de cadastro do usuario

@inicio_3
Cenario: Validar sobre tirar duvidas sobre meu negocio

    Dado que entrei no chatbot
    E selecionar a opção 'Sobre meu negócio'
    Quando seleciono a opcao de 'Tirar dúvidas' na pergunta o que deseja fazer
    Então valido que aparece a pergunta Qual a sua duvida?

@inicio_4
Cenario: Validar ajuda para comprar, opcao nao obrigada

    Dado que entrei no chatbot
    E selecionar a opção 'Ajuda para comprar'
    Quando aparece a mensagem de encaminhar para outro voluntario seleciono a opcao de 'Não, obrigada' 
    Então valido que aparece a mensagem de agradecemos o contato

@inicio_5
Cenario: Validar ajuda para comprar, opcao vamos la

    Dado que entrei no chatbot
    E selecionar a opção 'Ajuda para comprar'
    Quando aparece a mensagem de encaminhar para outro voluntario seleciono a opcao de 'Vamos lá!' 
    Então valido que fui trasnferido para o site ajude o pequeno