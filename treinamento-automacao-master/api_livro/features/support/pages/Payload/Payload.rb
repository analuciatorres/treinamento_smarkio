class Payload

    def dados_livro(identificacao, titulo, descricao, quant_paginas,  conteudo_livro, data_publicacao)
        JSON.generate({
            :"id"=> "#{identificacao}",
            :"title"=> "#{identificacao}",
            :"description"=> "#{identificacao}",
            :"pageCount"=> "#{identificacao}",
            :"excerpt"=> "#{identificacao}",
            :"publishDate"=> "#{identificacao}"
        }
    )
    end
end

