Dado('que realizo a consulta para o livro Treinamento dos Qas') do
    @identificacao = 20
    @response = Livro.new.consultar_livro(@identificacao)
end
  
Então('valido que foi retornado a busca com sucesso') do
    expect(@response.code).to eq(200)
    @response = JSON.parse(@response)
    expect(@response['id']).to eq(@identificacao)
    expect(@response['title']).to eq('Book 20')
    p "o livro consultado foi: #{@response['title']}"
end
  

Dado('que realizo o cadastro de um livro') do
    @identificacao = MASSA['identificacao']
    @titulo = MASSA['titulo']
    @descricao = MASSA['descricao']
    @quant_paginas = MASSA['quant_paginas']
    @conteudo_livro = MASSA['conteudo_livro']
    @data_publicacao = MASSA['data_publicacao']
    @response = Livro.new.cadastrar_livro(@identificacao, @titulo, @descricao, @quant_paginas, @conteudo_livro,@data_publicacao)

  end
  
Então('valido que foi cadastrado com sucesso') do
    expect(@response.code).to eq(200)
    @response = JSON.parse(@response)
    expect(@response['id']).to eq(@identificacao)
    expect(@response['title']).to eq(@titulo)
    p "o livro #{@response['title']} foi cadastradao com sucesso "
end
  

Dado('que tentomrealizar a consulta de um livro ainda não cadastrado') do
    @identificacao = MASSA['identificacao']
    @response = Livro.new.consultar_livro(@identificacao)
end
  
Então('valido o retorno da mensagem de erro') do
    expect(@response.code).to eq(404)
    p "O retorno foi: #{@response.code}"
end

Dado('que tento realizar o cadastro de um livro sem informar um titulo') do
    @identificacao = nil
    @titulo = nil
    @descricao = MASSA['descricao']
    @quant_paginas = MASSA['quant_paginas']
    @conteudo_livro = MASSA['conteudo_livro']
    @data_publicacao = MASSA['data_publicacao']
    @response = Livro.new.cadastrar_livro(@identificacao, @titulo, @descricao, @quant_paginas, @conteudo_livro,@data_publicacao)

end
  
Então('valido o retorno da mensagem de erro para falha no cadastramento do livro por falta de titulo') do
    expect(@response.code).to eq(400)
    p "O retorno foi: #{@response.code}"
end
  
  