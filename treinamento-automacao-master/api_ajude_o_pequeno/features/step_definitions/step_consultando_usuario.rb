Dado('que consulto um usuario cadastrado') do
    @body = Email.new.consultar_usuario(@infos)
end
  
Então('valido que foi retornado o cadastro do usuario') do
    Validacao.new.valida_consulta_usuario(@body)
end

  
Dado('que consulto um usuario não cadatrado') do
    @body = Email.new.consultar_usuario_inexistente
end
  
Então('valido que foi retornado que usuario não existente') do
    Validacao.new.valida_detalhes_email_inexistente(@body)

end