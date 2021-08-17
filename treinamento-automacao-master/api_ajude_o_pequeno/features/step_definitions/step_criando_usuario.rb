Dado('que crio um usuario') do
  @infos = Comum.new.gera_info
  @password = MASSA['password']
  @body = Email.new.cadastrar_usuario(@infos)
end

Então('valido a resposta usuario criado com sucesso') do
  Validacao.new.valida_usuario_novo(@body)
end

Dado('tento criar um usuario sem um email invalido') do
  @body = Email.new.faltando_dados
end

Então('valido a resposta de falta informacao') do
  Validacao.new.valida_faltando_campo(@body)
end

Dado('que tento cadastrar um usuario já cadastrado') do
  @body = Email.new.email_cadastrado
end

Então('valido a resposta de usuario já cadastrado') do
  Validacao.new.valida_email_cadastrado(@body)
end

  