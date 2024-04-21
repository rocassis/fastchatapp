import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.terms_conditions_title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _readMarkdownFile(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: RichText(
                  text: TextSpan(
                      text: snapshot.data.toString(),
                      style: const TextStyle(color: Colors.black)),
                ),
              );
            } else if (snapshot.hasError) {
              return RichText(
                  text: TextSpan(
                      text: AppLocalizations.of(context)!.file_error_text));
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  Future<String> _readMarkdownFile() async {
    final file = await DefaultAssetBundle.of(context).loadString(
        'assets/files/terms_conditions_${AppLocalizations.of(context)!.localeName}.md');
    return file;
  }
}
