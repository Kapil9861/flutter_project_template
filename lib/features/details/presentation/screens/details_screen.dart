import 'package:flutter/material.dart';
import 'package:template/common/widgets/language_selector.dart/language_selector.dart';
import 'package:template/l10n/app_localizations.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10.details), actions: [LanguageSelector()]),
      body: const Center(child: Text('Details Screen')),
    );
  }
}
