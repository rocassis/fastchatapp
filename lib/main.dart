// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneController = TextEditingController();
  /**
   * Init a chat on whatsapp with the number tiped by user
   */
  void _callWhatsApp() async {
    String url = "whatsapp://send/?phone=55" +
        phoneController.text +
        "&text&app_absent=0";
    if (await canLaunch(url)) {
      await launch(url);
      phoneController.text = "";
    } else {
      throw 'Could not launch $url';
    }
  }

  /**
   * Telegram not suports call with phone number 21/04/2022
   */
  // void _calltelegram() async {
  //   String url = "tg:resolve?phone=55" + phoneController.text;
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //     phoneController.text = "";
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        //       // Here we take the value from the MyHomePage object that was created by
        //       // the App.build method, and use it to set our appbar title.
        title: Text('Fast Chat'),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 0),
                child: Text('Digite o número com o DDD'),
              ),
              Text('Ex: 11912345678'),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 40),
                child: TextFormField(
                  controller: phoneController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton.icon(
                  onPressed: _callWhatsApp,
                  icon: Icon(
                    Icons.whatsapp,
                    size: 25,
                  ),
                  label: Text('WhatsApp')),
              // ElevatedButton.icon(
              //     onPressed: _calltelegram,
              //     icon: Icon(
              //       Icons.telegram,
              //       size: 25,
              //     ),
              //     label: Text('Telegam'))
            ],
          ),
        ),
      ),
    );
  }
}