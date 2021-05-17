// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  Computed<bool>? _$enableTouchModeComputed;

  @override
  bool get enableTouchMode =>
      (_$enableTouchModeComputed ??= Computed<bool>(() => super.enableTouchMode,
              name: '_AppStore.enableTouchMode'))
          .value;

  final _$_enableTouchModeAtom = Atom(name: '_AppStore._enableTouchMode');

  @override
  bool get _enableTouchMode {
    _$_enableTouchModeAtom.reportRead();
    return super._enableTouchMode;
  }

  @override
  set _enableTouchMode(bool value) {
    _$_enableTouchModeAtom.reportWrite(value, super._enableTouchMode, () {
      super._enableTouchMode = value;
    });
  }

  @override
  String toString() {
    return '''
enableTouchMode: ${enableTouchMode}
    ''';
  }
}
