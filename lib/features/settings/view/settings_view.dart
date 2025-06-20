import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yadana/core/settings/cubit/settings_cubit.dart';
import 'package:yadana/l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final cubit = context.read<SettingsCubit>();
    final state = context.watch<SettingsCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.chooseTheme)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.chooseTheme,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _ThemeButton(
                  label: 'Claro',
                  selected: state.themeMode == ThemeMode.light,
                  onTap: () => cubit.changeTheme(ThemeMode.light),
                ),
                const SizedBox(width: 12),
                _ThemeButton(
                  label: 'Oscuro',
                  selected: state.themeMode == ThemeMode.dark,
                  onTap: () => cubit.changeTheme(ThemeMode.dark),
                ),
                const SizedBox(width: 12),
                _ThemeButton(
                  label: 'Sistema',
                  selected: state.themeMode == ThemeMode.system,
                  onTap: () => cubit.changeTheme(ThemeMode.system),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              localizations.chooseLanguage,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _ThemeButton(
                  label: 'Español',
                  selected: state.locale.languageCode == 'es',
                  onTap: () => cubit.changeLocale(const Locale('es')),
                ),
                const SizedBox(width: 12),
                _ThemeButton(
                  label: 'English',
                  selected: state.locale.languageCode == 'en',
                  onTap: () => cubit.changeLocale(const Locale('en')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool selected;

  const _ThemeButton({
    required this.label,
    required this.onTap,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          foregroundColor: selected
              ? Colors.white
              : Theme.of(context).textTheme.bodyMedium?.color,
        ),
        onPressed: onTap,
        child: Text(label),
      ),
    );
  }
}
