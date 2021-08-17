# language: pt
# encode: UTF-8

@books
Funcionalidade: criar e consultar livros na biblioteca

@consulta_livros
Cenario:  realizar a consulta de um livro
    Dado que realizo a consulta para o livro Treinamento dos Qas
    Então valido que foi retornado a busca com sucesso

@cadastro_livro
Cenario: ralizar o cadastro de um novo livro
    Dado que realizo o cadastro de um livro
    Então valido que foi cadastrado com sucesso

#Cenarios de falha
@falha-consulta_livros
Cenario: Falha ao realizar a consulta de um livro
    Dado que tentomrealizar a consulta de um livro ainda não cadastrado
    Então valido o retorno da mensagem de erro

@falha_ao_cadastrar_livro
Cenario: Falah ao realizar o cadastro de um livro
    Dado que tento realizar o cadastro de um livro sem informar um titulo
    Então valido o retorno da mensagem de erro para falha no cadastramento do livro por falta de titulo