import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fast Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fast Chat App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneController = TextEditingController();
  var phoneMask = MaskTextInputFormatter(
      mask: '(##) 9####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  /// Init a chat on whatsapp with the number tiped by user
  void _callWhatsApp() async {
    String url = "whatsapp://send/?phone=55" +
        phoneController.text.replaceAll(RegExp('[^A-Za-z0-9]'), '.') +
        "&text&app_absent=0";
    if (await canLaunch(url)) {
      await launch(url);
      phoneController.text = "";
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Telegram not suports call with phone number 21/04/2022
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
                  inputFormatters: [phoneMask],
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
