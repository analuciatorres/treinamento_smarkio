Dado('crio uma loja') do
    @body = Criar_loja.new.criacao_loja(@infos)
  end
  
Então('valido a resposta loja criada com sucesso') do
    Validacao.new.valida_criaco_loja(@body, @infos)
end
  
Dado('tento criar uma loja faltando informações') do
  @body = Criar_loja.new.criacao_loja_erro
end
  
Então('valido a resposta de não foi possivel criar a loja') do
  Validacao.new.valida_criaco_loja_erro(@body)
end