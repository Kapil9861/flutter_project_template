import 'package:flutter/material.dart';
import 'package:template/common/widgets/language_selector.dart/language_selector.dart';
import 'package:template/l10n/app_localizations.dart';
import 'package:template/src/messages.g.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final api = MessageFromNative();
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10.login), actions: [LanguageSelector()]),
      body: Column(
        children: [
          const Center(child: Text('Login Screen')),
          ElevatedButton(
            child: Text('Ping Kotlin'),
            onPressed: () async {
              await api.greetUser(
                'Kapil Aryal',
              ); // This calls the Kotlin method
            },
          ),
        ],
      ),
    );
  }
}
