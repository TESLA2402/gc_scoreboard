// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommonStore on _CommonStore, Store {
  late final _$competitionAtom =
      Atom(name: '_CommonStore.competition', context: context);

  @override
  String get competition {
    _$competitionAtom.reportRead();
    return super.competition;
  }

  @override
  set competition(String value) {
    _$competitionAtom.reportWrite(value, super.competition, () {
      super.competition = value;
    });
  }

  late final _$pageAtom = Atom(name: '_CommonStore.page', context: context);

  @override
  String get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(String value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$_CommonStoreActionController =
      ActionController(name: '_CommonStore', context: context);

  @override
  void setCompetition(String newIndex) {
    final _$actionInfo = _$_CommonStoreActionController.startAction(
        name: '_CommonStore.setCompetition');
    try {
      return super.setCompetition(newIndex);
    } finally {
      _$_CommonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(String newIndex) {
    final _$actionInfo = _$_CommonStoreActionController.startAction(
        name: '_CommonStore.setPage');
    try {
      return super.setPage(newIndex);
    } finally {
      _$_CommonStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
competition: ${competition},
page: ${page}
    ''';
  }
}