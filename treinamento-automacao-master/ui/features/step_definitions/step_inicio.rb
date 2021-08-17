Dado('que entrei no chatbot') do
  visit(DATA[$ambiente]['site'])
  Comum.new.texto_existe('Olá! 👋🏻 Sou a a Ana Paula, voluntária virtual do Ajude o Pequeno.')
  @nome = $scn
  @nome = @nome.gsub(/\s+/, "")
  @recorder = Comum.new.screen_recorder(@nome)
  @recorder.start
end

Quando('selecionar a opção {string}') do |opcao|
  Comum.new.titulo_existe('Para poder te ajudar, me diz sobre o que você deseja falar:')
  Comum.new.selecionar_opcao(opcao)
  Comum.new.screenshot("seleciona_opcao_#{opcao}")
end

Então('valido apresentar um email de contato') do
  Comum.new.texto_existe('Fico feliz que você quer nos ajudar! Você pode entrar em contato conosco pelo e-mail cadastro@ajudeopequeno.com.br')
  Comum.new.screenshot("email_de_contato")
  sleep(2)
  @recorder.stop
end

Quando('seleciono a opcao de {string} na pergunta o que deseja fazer') do |opcao|
  Comum.new.titulo_existe('Certo, e o que você quer fazer?')
  Comum.new.selecionar_opcao(opcao)
  Comum.new.screenshot("opcao_#{opcao}_deseja_fazer")
end

Então('valido que fui direcionado para o fluxo de cadastro do usuario') do
  Comum.new.texto_existe('Para iniciar o seu cadastro me diga, qual é o seu nome completo?')
  Comum.new.screenshot("fluxo_cadastro_usuario")
  sleep(2)
  @recorder.stop
end

Então('valido que aparece a pergunta Qual a sua duvida?') do 
  Comum.new.texto_existe('Qual a sua dúvida?')
  Comum.new.screenshot("qual_a_duvida")
  sleep(2)
  @recorder.stop
end

Quando('aparece a mensagem de encaminhar para outro voluntario seleciono a opcao de {string}') do |opcao|
  Comum.new.texto_existe('Tudo bem! Vou te enviar para outra voluntária, a Alê, que vai ajudar com as compras.')
  Comum.new.selecionar_opcao(opcao)
  Comum.new.screenshot("encaminhar_outro_voluntario")
end


Então('valido que aparece a mensagem de agradecemos o contato') do
  Comum.new.texto_existe('Sem problemas! Nós do Ajude o Pequeno agradecemos o contato! 💙 Se precisar de mais alguma insformação basta enviar uma nova mensagem.')
  Comum.new.screenshot("agradeco")
  sleep(2)
  @recorder.stop
end

Então('valido que fui trasnferido para o site ajude o pequeno') do
  expect(page).to have_link('https://marketplace.ajudeopequeno.com.br/')
  sleep(2)
  @recorder.stop
end



