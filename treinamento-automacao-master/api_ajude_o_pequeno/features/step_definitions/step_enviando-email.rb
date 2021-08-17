Dado('que envio um email com sucesso') do
    @body = Email.new.enviar_email_faq
  end
  
  Então('valido a resposta email enviado com sucesso') do
    Validacao.new.validar_envio_email(@body)
  end
  
  Dado('que envio um email invalido') do
    @body = Email.new.enviar_email_erro
  end
  
  Então('valido a resposta email enviado invalido') do
    Validacao.new.validar_envio_email_erro(@body)
  end
  