import 'package:flutter/material.dart';
import 'package:template/common/widgets/language_selector.dart/language_selector.dart';
import 'package:template/l10n/app_localizations.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Welcome'), actions: [LanguageSelector()]),
      body: Center(
        child: Text(
          '${l10.welcome} to Project Template',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
