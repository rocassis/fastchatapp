import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Termos e Condições'),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Descrição do Serviço',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'O FastChat é um aplicativo que permite iniciar conversas em aplicativos de mensagens sem precisar salvar contatos no smartphone. O aplicativo oferece as seguintes funcionalidades:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '* Selecionar um aplicativo de mensagens (WhatsApp, Telegram, Signal, etc.).',
              ),
              const Text(
                '* Digitar o número de telefone do destinatário.',
              ),
              const Text(
                '* Digitar a mensagem que você deseja enviar.',
              ),
              const Text(
                '* Enviar a mensagem.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Uso do Serviço',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'O FastChat é um serviço gratuito para uso pessoal. Você não pode usar o FastChat para fins comerciais ou para enviar mensagens de spam.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Conteúdo Proibido',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Você não pode usar o FastChat para enviar mensagens que contenham:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '* Conteúdo ilegal ou ofensivo.',
              ),
              const Text(
                '* Ameaças ou intimidação.',
              ),
              const Text(
                '* Discurso de ódio ou discriminação.',
              ),
              const Text(
                '* Spam ou propaganda.',
              ),
              const Text(
                '* Informações pessoais ou confidenciais.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Privacidade',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'O FastChat não armazena nenhuma informação pessoal sobre você ou seus contatos. As mensagens que você envia são armazenadas nos servidores dos aplicativos de mensagens que você usa.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Isenção de Responsabilidade',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'O FastChat não se responsabiliza por:',
              ),
              const SizedBox(height: 8.0),
              const Text(
                '* Erros ou falhas no serviço.',
              ),
              const Text(
                '* Danos causados por mensagens enviadas através do serviço.',
              ),
              const Text(
                '* Conteúdo ilegal ou ofensivo enviado através do serviço.',
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Modificação dos Termos e Condições',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'O FastChat pode modificar estes termos e condições a qualquer momento. Você será notificado sobre as modificações por e-mail ou através do aplicativo.',
              ),
            ])));
  }
}
