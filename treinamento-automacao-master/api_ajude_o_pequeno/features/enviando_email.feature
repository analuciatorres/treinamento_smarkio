#language: pt

@enviando_email
Funcionalidade: Enviando email
    @enviar_email_sucesso
    Cenario: validar que enviei um email com  sucesso
        Dado que envio um email com sucesso
        Então valido a resposta email enviado com sucesso

    @enviar_email_erro
    Cenario: validar que enviei um email invalido
        Dado que envio um email invalido
        Então valido a resposta email enviado invalido
