// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  Computed<String>? _$getThemeComputed;

  @override
  String get getTheme =>
      (_$getThemeComputed ??= Computed<String>(() => super.getTheme,
              name: '_SettingsStoreBase.getTheme'))
          .value;
  Computed<ThemeMode>? _$getSelectedRadioComputed;

  @override
  ThemeMode get getSelectedRadio => (_$getSelectedRadioComputed ??=
          Computed<ThemeMode>(() => super.getSelectedRadio,
              name: '_SettingsStoreBase.getSelectedRadio'))
      .value;

  final _$selectedRadioAtom = Atom(name: '_SettingsStoreBase.selectedRadio');

  @override
  ThemeMode get selectedRadio {
    _$selectedRadioAtom.reportRead();
    return super.selectedRadio;
  }

  @override
  set selectedRadio(ThemeMode value) {
    _$selectedRadioAtom.reportWrite(value, super.selectedRadio, () {
      super.selectedRadio = value;
    });
  }

  final _$setThemeAsyncAction = AsyncAction('_SettingsStoreBase.setTheme');

  @override
  Future<void> setTheme(ThemeMode theme) {
    return _$setThemeAsyncAction.run(() => super.setTheme(theme));
  }

  @override
  String toString() {
    return '''
selectedRadio: ${selectedRadio},
getTheme: ${getTheme},
getSelectedRadio: ${getSelectedRadio}
    ''';
  }
}
