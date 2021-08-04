class Comum
  include Capybara::DSL

################################ WEB ################################
  def login_web
    visit(DATA[$ambiente]['site_bot'])
    sleep(2)
  end

  def opcao_existe(opcao)
    assert_selector(EL['label_option'], visible: true)
    qnt_opcoes = all(EL['label_option']).length
    cont = 0
    while cont < qnt_opcoes
      text = all(EL['label_option'], visible: true)[cont].text
      if text.include?(opcao)
        contem_texto = true
        break
      else
        cont +=1
      end
    end
    if contem_texto == true
    else
      raise "O texto '#{opcao}' não está sendo apresentado"
    end
  end

  def texto_existe(texto)
    assert_selector(EL['txt_whats'], visible: true, text: texto)
    # if  == true
    #   #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    # else
    #   raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    # end
  end

  def texto_existe_exato(texto)
    if assert_selector(EL['txt_whats'], visible: true, text: texto, exact_text: true) == true
      #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #esse metodo compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end

  def texto_existe_minimo(texto)
    if assert_selector(EL['txt_whats'], visible: true, text: texto, exact_text: true) == true
      #p "O texto '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O texto '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #esse metodo compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end

  def titulo_existe(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto) == true
      #p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
  end

  def titulo_existe_exato(texto)
    if assert_selector(EL['title_text'], visible: true, text: texto, exact_text: true) == true
      p "O titulo '#{texto}' é compatível com o que esta sendo apresentado no bot"
      #aqui você pode colocar uma mensagem que te irá aparecer quando sua string for igual a frase que esta dentro do elemento
    else
      raise "O título '#{texto}' não é compativel com o que esta sendo apresentado no bot"
    end
    #esse metodo compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
  end

  def selecionar_opcao(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao).click
  end

  def selecionar_opcao_exato(opcao)
    opcao_existe(opcao)
    find(EL['label_option'], text: opcao, exact_text: true).click
  end

  def preenche_campo(texto)
    assert_selector(EL['box_text'], visible: true)
    all(EL['box_text'])[0].set(texto)
  end

  def clica_enviar
    all(EL['btn_enviar'])[0].click
  end

  def clicar_pesquisa(opcao)
    assert_selector(EL['btn_pesquisa'], visible: true, text: opcao)
    find(EL['btn_pesquisa'], text: opcao).click
  end

  def primeira_opcao
    all(EL['label_option'])[0].click
  end

  def contem_texto(texto)
    sleep(10)
    qtd = ((all(EL['txt_whats']).length) -1)
    text = all(EL['txt_whats'])[qtd].text
      if text.include?(texto)
      else
        raise "texto nao esta sendo apresentado"
      end
  end

  def gera_info
    nome =  Faker::Name.name
    nome = nome.tr('ÂÁÉÍÓÚàáäâãèéëẽêìíïîĩòóöôõùúüûũñç', 'AAEIOUaaaaaeeeeeiiiiiooooouuuuunc')
    nome.gsub! '.','abcd'
    cpf = Faker::IDNumber.brazilian_citizen_number(formatted: true)
    email = Faker::Internet.email
    Faker::Config.locale = 'pt-BR'
    celular = Faker::PhoneNumber.cell_phone
    # cep = Faker::Address.zip_code(state_abbreviation = 'Br')
    cep = '01301-000'
    return nome, email, cpf, celular, cep
  end

  def foco_browser
    result = page.driver.browser.window_handles.last
    page.driver.browser.switch_to.window(result)
  end

  def screenshot(nome)
    sleep(2)
    nome.gsub! '/','_'
    save_screenshot("data/reports/screenshots/evidencias/#{nome}}.png")
  end

################################ FILMAGEM EVIDENCIAS ################################
  def screen_recorder (cenario)
    advanced = {
    input:    {
        framerate:  30,
        video_size: '1366x768'
    },
    output:   {
        r:       15, # Framerate
    },
    log:      'recorder.log',
    loglevel: 'level+debug', # For FFmpeg
    }
    ScreenRecorder::Desktop.new(output: "data/video/#{cenario}.mp4", advanced: advanced)
  end

  def iniciando_filmagem
    nome = ("#{@@tag}#{@@scn}").gsub(/\s+/, "")
    nome = nome.gsub(",Exemplos(#", "_")
    nome = nome.gsub(")", "")
    @@recorder = Comum.new.screen_recorder(nome)
    #@@recorder.start
  end

  def encerrando_filmagem
    sleep(2)
    #@@recorder.stop
  end

################################ ALTU ################################
  def preenche_campo_altu(texto)
    assert_selector(EL['mensagem_usuario'], visible: true)
    all(EL['mensagem_usuario'])[0].set(texto)
  end

  def texto_existe_altu(texto)
    assert_selector(EL['mensagem_bot'], visible: true, text: texto)
    #esse metodo compara o que tem dentro da nossa string com o que tem dentro do elemento, se o que tem na nossa string contem dentro do elemento, ele passa como true, ou seja, funciona.
    #exemplo: frase no bot(elemento): "Olá, eu sou a Bruna, tudo bem?" frase da string(step): "Olá, eu sou a Bruna" - esse exemplo ele retorna como true, mesmo estando incompleto, se quiser que seja exatamente igual, use o metodo texto_existe_exato_altu
  end

  def texto_existe_exato_altu(texto)
    assert_selector(EL['mensagem_bot'], visible: true, text: texto, exact_text: true)
    #esse metodo compara o que tem dentro do elemento com o que tem dentro da nossa string que colocamos no step e verifica se é EXATAMENTE igual, se não for ira dar erro
    #exemplo: frase no bot(elemento): "Olá, eu sou a Bruna, tudo bem?" frase da string(step): "Olá, eu sou a Bruna, tudo bem?" - esse exemplo ele retorna como true, pq as frases são exatamentes iguais
  end

  def clica_enviar_altu
    all(EL['botao_enviar_chat'])[0].click
  end

  def acessando_altu(login, senha)
    assert_selector(EL['login_altu'], visible: true)
    all(EL['login_altu'])[0].set(login)
    #acima estamos preenchendo o campo e-mail de Login do altu com nosso e-mail que deve ser colocado no arquivo massa.yml
    assert_selector(EL['senha_altu'], visible: true)
    all(EL['senha_altu'])[0].set(senha)
    #acima estamos preenchendo o campo senha de Login do altu com nossa senha que deve ser colocado no arquivo massa.yml
    all(EL['botao_enviar_altu'])[0].click #botão que clica para entrar com o login
  end

  def login_altu
    visit('https://portoconsorcio.altu.com.br/assistants/builder/2')
    acessando_altu(MASSA['login'], MASSA['senha'])
    page.driver.open_new_window
    foco_browser
    sleep(3)
    visit('https://portoconsorcio.altu.com.br/assistants/debugger/2?channel=whatsapp')
    sleep(2)
  end

end