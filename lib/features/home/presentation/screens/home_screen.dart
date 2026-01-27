import 'package:flutter/material.dart';
import 'package:project_template/l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10.home)),
      body: const Center(child: Text('Home Screen')),
    );
  }
}
