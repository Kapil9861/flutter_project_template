import 'package:flutter/material.dart';
import 'package:project_template/common/widgets/language_selector.dart/language_selector.dart';
import 'package:project_template/l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10.login), actions: [LanguageSelector()]),
      body: const Center(child: Text('Login Screen')),
    );
  }
}
