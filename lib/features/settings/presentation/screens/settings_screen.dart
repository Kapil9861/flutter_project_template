import 'package:flutter/material.dart';
import 'package:project_template/l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10.settings)),
      body: const Center(child: Text('Settings Screen')),
    );
  }
}
