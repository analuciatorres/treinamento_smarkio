class Email

    def consultar_usuario(infos)
        @nome = MASSA['nome']
        @email = MASSA['email']
        endpoint = "#{DATA['endpoint']['details_user']}#{@email}"
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        @body = ""
        @body = Comum.new.test_get(url, endpoint)
        @body
    end

    def consultar_usuario_inexistente
      @nome = MASSA['nome']
      @email = MASSA['email_ncadastrado']
      endpoint = "#{DATA['endpoint']['details_user']}#{@email}"
      url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
      @body = ""
      @body = Comum.new.test_get(url, endpoint)
      @body
    end

    def cadastrar_usuario(infos)
        endpoint = "#{DATA['endpoint']['create_user']}"
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        payload = Payload.new.criar_usuario(infos)
        @body = ""
        @body = Comum.new.test_post(url, payload, endpoint)
        @body
    end

    def faltando_dados
        endpoint = DATA['endpoint']['create_user']
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        infos = ['email@mail.com']
        payload = Payload.new.faltando_email(infos)
        @body = ""
        @body = Comum.new.test_post(url, payload, endpoint)
        @body 
      end

    def email_cadastrado
        endpoint = DATA['endpoint']['create_user']
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        infos = ['Murillo Teste', 'email@mail.com']
        payload = Payload.new.criar_usuario(infos)
        @body = ""
        @body = Comum.new.test_post(url, payload, endpoint)
        @body 
      end

      def enviar_email_faq
        endpoint = DATA['endpoint']['send_email_faq']
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        infos = ['José da Silva', 'josesilva@mail.com', "O que é vendido na loja?"]
        payload = Payload.new.enviar_email(infos[0], infos[1], infos[2])
        @body = ""
        @body = Comum.new.test_post(url, payload, endpoint)
        @body 
      end

      def enviar_email_erro
        endpoint = "#{DATA['endpoint']['send_email_faq']}"
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        @body = ""
        payload = Payload.new.enviar_email_erro
        @body = Comum.new.test_post(url, payload, endpoint)
        @body 
    end

end



