import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showWhatsAppInput = false;
  bool _showTelegramInput = false;
  final TextEditingController _phoneNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                'FastChatApp foi feito para facilitar as conversas com apps sem precisar salvar contatos no smartphone'),
            // Stacked Material3 buttons with equal width
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => setState(
                          () => _showWhatsAppInput = !_showWhatsAppInput),
                      icon: const Icon(FontAwesomeIcons.whatsapp,
                          color: Colors.white),
                      label: const Text('WhatsApp',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton.icon(
                      onPressed: () => setState(
                          () => _showTelegramInput = !_showTelegramInput),
                      icon: const Icon(Icons.telegram, color: Colors.white),
                      label: const Text('Telegram',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Visibility(
              visible: _showWhatsAppInput,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle opening WhatsApp chat with the entered phone number
                      // (Replace with appropriate action based on your implementation)
                      print(
                          'Opening WhatsApp chat with ${_phoneNumberController.text}');
                    },
                    child: const Text('Chat'),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _showTelegramInput,
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle opening Telegram chat with the entered phone number
                      // (Replace with appropriate action based on your implementation)
                      print(
                          'Opening Telegram chat with ${_phoneNumberController.text}');
                    },
                    child: const Text('Chat'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
