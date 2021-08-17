class Criar_loja


    def criacao_loja(infos)
        endpoint = "#{DATA['endpoint']['create_store']}"
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        @body = ""
        payload = Payload.new.criando_loja(infos)
        @body = Comum.new.test_post(url, payload, endpoint)
        p @body
        @body 
    end

    def criacao_loja_erro
        endpoint = "#{DATA['endpoint']['create_store']}"
        url = "#{DATA[$ambiente]['url_api']}#{endpoint}"
        @body = ""
        payload = Payload.new.criando_loja_erro
        @body = Comum.new.test_post(url, payload, endpoint)
        @body 
    end


end