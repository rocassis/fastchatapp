import 'package:fastchatapp2/app/core/helpers.dart';
import 'package:fastchatapp2/app/pages/widgets/alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  // PhoneNumber number = PhoneNumber(isoCode: 'BR');
  PhoneNumber number = PhoneNumber(isoCode: Helpers().getLocationCountryCode());
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
            Text(AppLocalizations.of(context)!.whatsapp_text),
            const SizedBox(height: 20.0),
            InternationalPhoneNumberInput(
              // locale: Platform.localeName,
              locale: Helpers().getLocationCountryCode(),
              onInputChanged: (PhoneNumber number) {
                _phoneNumberController.text = number.phoneNumber.toString();
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                useBottomSheetSafeArea: true,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: true,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: false),
              inputBorder: const OutlineInputBorder(),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: ElevatedButton(
                onPressed: () {
                  _callWhatsApp();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Colors.green,
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

  void _callWhatsApp() async {
    if (_phoneNumberController.text.isEmpty) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              text: AppLocalizations.of(context)!.empty_text);
        },
      );
    }
    String url =
        "whatsapp://send/?phone=${_phoneNumberController.text.replaceAll(RegExp('[^A-Za-z0-9]'), '.')}&text&app_absent=0";
    Uri urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogWidget(
              text: AppLocalizations.of(context)!.whatsapp_error);
        },
      );
    }
  }
}
