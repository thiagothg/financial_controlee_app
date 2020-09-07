// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerMenuController on _DrawerMenuControllerBase, Store {
  final _$userModelAtom = Atom(name: '_DrawerMenuControllerBase.userModel');

  @override
  User get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(User value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  @override
  String toString() {
    return '''
userModel: ${userModel}
    ''';
  }
}
