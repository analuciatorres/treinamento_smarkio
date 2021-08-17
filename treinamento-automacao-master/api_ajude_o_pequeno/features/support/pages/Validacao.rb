class Validacao


    def valida_consulta_usuario(body)   
        if body['user'].has_key?("name") == true && body['user']['name'] == @nome
            p "Detalhes do usuarios esta correto com o nome, Nome: #{body['user']['name']}"
            if body['user'].has_key?("email") == true && body['user']['email'] == @email
                p "Detalhes do usuarios esta correto com o email, Email: #{body['user']['email']}"
            else 
                raise "nome ou email nao esta apresentando corretamente"
            end

        end
        p "Detalhes do usuarios esta correto"
    end

    def valida_usuario_novo(body)
        if body['user'].has_key?("token") == true
          p "Token criado com sucesso, Token: #{body['user']['token']}"
        else 
          raise "erro"
        end
    end

    def valida_faltando_campo(body)
        if body.has_key?("message") == true && body['message'] == "Um dos parâmetros necessários (full_name, email, or password) não foi encontrado no corpo da requisição"
            p "Não foi possivel criar um usuario, erro: #{body['message']}" 
        else 
            raise "cadastrado com sucesso"
        end
    end
    
    def valida_email_cadastrado(body)
        if body['message'].has_key?("error") == true && body['message']['error'] == "E-mail já cadastrado"
            p "Não foi possivel criar um usuario, erro: #{body['message']['error']}" 
        else 
            raise "cadastrado com sucesso"
        end
    end

    def valida_detalhes_email_inexistente(body)
        if body['message'].has_key?("error") == true && body['message']['error'] == "Usuário não encontrado"
            p "Não foi possivel verificar o usuario, erro: #{body['message']['error']}" 
        else 
            raise "cadastrado com sucesso"
        end
    end

    def valida_criaco_loja(body, infos)
        if body['store']['name'] == infos[0] && body['store']['cnpj'] == infos[2]
            p "Loja criada com sucesso"
        else 
            raise "loja nao foi criada"
        end
    end

    def valida_criaco_loja_erro(body)
        if body.has_key?("message") == true && body['message'] == 'Não foi possivel criar a loja, certifique-se de que todos os parâmetros necessários (name, email, type, cep, state, city, neighborhood, address, addressNo, ddd, phone, mailDelivery) estão presentes no corpo da requisição'
            p "Não foi possivel criar a loja, erro: #{body['message']}" 
        else 
            raise "loja criada com sucesso"
        end
    end

    def validar_envio_email(body)
        if body.has_key?("message") == true && body['message'] == 'Email enviado com sucesso!'
            p "Sucesso ao enviar o email, Message: #{body['message']}" 
        else 
            raise "emaill nao foi enviado"
        end
    end

    def validar_envio_email_erro(body)
        if body.has_key?("message") == true && body['message'] == 'Não foi possível enviar seu email, certifique-se de que todos os parâmetros necessários (name, email, message) estão presentes no corpo da requisição'
            p "Sucesso ao enviar o email, Message: #{body['message']}" 
        else 
            raise "emaill nao foi enviado"
        end
    end

end