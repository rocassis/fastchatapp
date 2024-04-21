import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.privacy_policy_title),
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
        'assets/files/privacy_policy_${AppLocalizations.of(context)!.localeName}.md');
    return file;
  }
}
// class PrivacyPolicyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Privacy Policy'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Effective Date: 2024-03-06',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'FastChatApp ("we", "us", or "our") is committed to protecting your privacy. This Privacy Policy explains how we collect, use, and disclose information when you use our mobile application, FastChatApp (the "App").',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Information We Collect',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'We do not collect any personal information from you through the App. This includes, but is not limited to, your name, email address, phone number, contacts, location, or device information.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Use of Information',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'We do not use any information collected through the App.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Sharing of Information',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'We do not share any information collected through the App with any third party.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Security',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'We take reasonable steps to protect the information you provide to us from unauthorized access, disclosure, alteration, or destruction. However, no internet transmission or electronic storage is completely secure, and we cannot guarantee the security of your information.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Changes to this Privacy Policy',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page. You are advised to review this Privacy Policy periodically for any changes.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '## Contact Us',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               'If you have any questions about this Privacy Policy, please contact us at [your email address].',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
