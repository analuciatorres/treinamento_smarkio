class Payload

    def criar_usuario(infos)
        JSON.generate({
            :"name"=> "#{infos[0]}",
            :"email"=> "#{infos[1]}",
            :"password"=> "#{'123Mudar'}"
        }
    )
    end

    def faltando_email(infos)
        JSON.generate({
            :"name"=> "#{infos[0]}",
            :"password"=> "123Mudar"
            }
        )
    end

    def criando_loja(infos)
        JSON.generate({
            :"name"=> "#{infos[0]}",
            :"email"=> "#{infos[1]}",
            :"cnpj"=> "#{infos[2]}",
            :"type"=> "Loja",
            :"cep"=> "57035552",
            :"state"=> "MG",
            :"city"=> "Maceió",
            :"neighborhood"=> "Vizinhança da Tubarão",
            :"address"=> "Rua Dr. Roland Simons",
            :"addressNo"=> "13",
            :"ddd"=> "82",
            :"phone"=> "999999999",
            :"instagram"=> "_testeinstagram",
            :"mailDelivery"=> "0"
            }
        )
    end

    def criando_loja_erro
        JSON.generate({
            :"state"=> "MG",
            :"city"=> "Maceió",
            :"neighborhood"=> "Vizinhança da Tubarão",
            :"address"=> "Rua Dr. Roland Simons",
            :"addressNo"=> "13",
            :"ddd"=> "82",
            :"phone"=> "999999999",
            :"instagram"=> "_testeinstagram",
            :"mailDelivery"=> "0"
            }
        )
    end

    def enviar_email(name, email, message)
        JSON.generate({
            :"name"=> "João da Silva Sauro",
            :"email"=> "joao_saurogmail.com",
            :"message"=> "O que é faq"
            }
        )
    end
    
    def enviar_email_erro
        JSON.generate({
            :"name"=> "guilherme",
            :"email"=> "gsilvaborges@gmail.com"
            }
        )
    end

end


