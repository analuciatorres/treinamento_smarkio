class Livro

    def consultar_livro(identificacao)
        queryparam = identificacao
        endpoint = "#{DATA['endpoint']['books']}/#{queryparam}"
        url = "#{DATA['dev']['url_api']}#{endpoint}"
        @body = ""
        @body = Comum.new.test_get(url, endpoint)
        response = @body
    end

    def cadastrar_livro(identificacao, titulo, descricao, quant_paginas,  conteudo_livro, data_publicacao)
        endpoint = "#{DATA['endpoint']['books']}"
        url = "#{DATA['dev']['url_api']}#{endpoint}"
        payload = Payload.new.dados_livro(identificacao, titulo, descricao, quant_paginas,  conteudo_livro, data_publicacao)
        @body = ""
        @body = Comum.new.test_post(url, payload, endpoint)
        response = @body
    end
end


