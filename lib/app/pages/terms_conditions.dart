import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Termos e Condições'),
        ),
        body: const SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Descrição do Serviço',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'O FastChat é um aplicativo que permite iniciar conversas em aplicativos de mensagens sem precisar salvar contatos no smartphone. O aplicativo oferece as seguintes funcionalidades:',
              ),
              SizedBox(height: 8.0),
              Text(
                '* Selecionar um aplicativo de mensagens (WhatsApp, Telegram, Signal, etc.).',
              ),
              Text(
                '* Digitar o número de telefone do destinatário.',
              ),
              Text(
                '* Digitar a mensagem que você deseja enviar.',
              ),
              Text(
                '* Enviar a mensagem.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Uso do Serviço',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'O FastChat é um serviço gratuito para uso pessoal. Você não pode usar o FastChat para fins comerciais ou para enviar mensagens de spam.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Conteúdo Proibido',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Você não pode usar o FastChat para enviar mensagens que contenham:',
              ),
              SizedBox(height: 8.0),
              Text(
                '* Conteúdo ilegal ou ofensivo.',
              ),
              Text(
                '* Ameaças ou intimidação.',
              ),
              Text(
                '* Discurso de ódio ou discriminação.',
              ),
              Text(
                '* Spam ou propaganda.',
              ),
              Text(
                '* Informações pessoais ou confidenciais.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Privacidade',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'O FastChat não armazena nenhuma informação pessoal sobre você ou seus contatos. As mensagens que você envia são armazenadas nos servidores dos aplicativos de mensagens que você usa.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Isenção de Responsabilidade',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'O FastChat não se responsabiliza por:',
              ),
              SizedBox(height: 8.0),
              Text(
                '* Erros ou falhas no serviço.',
              ),
              Text(
                '* Danos causados por mensagens enviadas através do serviço.',
              ),
              Text(
                '* Conteúdo ilegal ou ofensivo enviado através do serviço.',
              ),
              SizedBox(height: 16.0),
              Text(
                'Modificação dos Termos e Condições',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'O FastChat pode modificar estes termos e condições a qualquer momento. Você será notificado sobre as modificações por e-mail ou através do aplicativo.',
              ),
            ])));
  }
}
