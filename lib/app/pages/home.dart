import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fastchatapp2/app/pages/about.dart';
import 'package:fastchatapp2/app/pages/signal.dart';
import 'package:fastchatapp2/app/pages/telegram.dart';
import 'package:fastchatapp2/app/pages/whatsapp.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(AppLocalizations.of(context)!.home_header_text)),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WhatsAppPage()),
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.whatsapp,
                          color: Colors.white),
                      label: const Text('WhatsApp',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TelegramPage()),
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.telegram,
                          color: Colors.white),
                      label: const Text('Telegram',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignalPage()),
                        );
                      },
                      icon: const Icon(FontAwesomeIcons.signalMessenger,
                          color: Colors.white),
                      label: const Text('Signal',
                          style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        backgroundColor: const Color(0XFF3273DC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    )
                  ],
                ),
              )),
              const Spacer(), // Push remaining content to bottom
              // Link to about page at bottom
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutPage()),
                  );
                },
                child: Text(AppLocalizations.of(context)!.about_text),
              ),
            ],
          ),
        ));
  }
}
