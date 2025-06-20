part of 'settings_cubit.dart';

@immutable
class SettingsState {
  final ThemeMode themeMode;
  final Locale locale;

  const SettingsState({required this.themeMode, required this.locale});

  SettingsState copyWith({ThemeMode? themeMode, Locale? locale}) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  Map<String, dynamic> toMap() {
    return {'themeMode': themeMode.index, 'locale': locale.languageCode};
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      themeMode: ThemeMode.values[map['themeMode'] ?? 0],
      locale: Locale(map['locale'] ?? 'es'),
    );
  }
}
