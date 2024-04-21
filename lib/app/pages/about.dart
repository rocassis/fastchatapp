import 'package:fastchatapp2/app/pages/privacy_policy.dart';
import 'package:fastchatapp2/app/pages/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    print(AppLocalizations.of(context)!.localeName);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.about_page_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.about_header_title,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            // Text(
            //   AppLocalizations.of(context)!.about_page_text,
            //   style: const TextStyle(fontSize: 16),
            // ),
            const SizedBox(height: 20),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage()),
                );
              },
              child: Text(AppLocalizations.of(context)!.privacy_policy_text),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsPage()),
                );
              },
              child: Text(AppLocalizations.of(context)!.terms_conditions_text),
            ),
            Text(
              '${AppLocalizations.of(context)!.version_text}: 1.0.0',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
