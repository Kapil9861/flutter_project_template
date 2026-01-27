import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_template/core/providers/locale_provider.dart';
import 'package:project_template/l10n/app_localizations.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    return Column(
      children: [
        Text(
          l10n.changeLanguage,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        // const SizedBox(height: 8),
        SegmentedButton<String>(
          segments: [
            ButtonSegment(
              value: 'en',
              label: Text(l10n.english),
              icon: const Icon(Icons.language),
            ),
            ButtonSegment(
              value: 'ne',
              label: Text(l10n.nepali),
              icon: const Icon(Icons.language),
            ),
          ],
          selected: {currentLocale.languageCode},
          onSelectionChanged: (Set<String> selected) {
            // Use notifier method instead of assigning to protected `state`
            ref.read(localeProvider.notifier).changeLanguage(selected.first);
          },
        ),
      ],
    );
  }
}
