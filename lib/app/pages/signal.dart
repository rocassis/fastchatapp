import 'package:fastchatapp2/app/pages/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignalPage extends StatefulWidget {
  const SignalPage({super.key});

  @override
  State<SignalPage> createState() => _SignalPageState();
}

class _SignalPageState extends State<SignalPage> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Text(AppLocalizations.of(context)!.signal_text),
            const SizedBox(height: 20.0),
            TextField(
              controller: _inputController,
              onChanged: (value) {
                _inputController.text = value;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  _callTelegram();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Chat',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void _callTelegram() async {
    if (_inputController.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              text: AppLocalizations.of(context)!.empty_text);
        },
      );
    }
    String url = "sgnl://signal.me/#u/${_inputController.text}";
    Uri urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              text: AppLocalizations.of(context)!.signal_error);
        },
      );
    }
  }
}
