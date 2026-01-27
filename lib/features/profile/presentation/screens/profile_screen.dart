import 'package:flutter/material.dart';
import 'package:project_template/l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10 = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10.profile)),
      body: const Center(child: Text('Profile Screen')),
    );
  }
}
