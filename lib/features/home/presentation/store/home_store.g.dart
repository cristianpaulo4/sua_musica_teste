// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  late final _$listGamesAtom =
      Atom(name: '_HomeStoreBase.listGames', context: context);

  @override
  ObservableFuture<List<GameModel>> get listGames {
    _$listGamesAtom.reportRead();
    return super.listGames;
  }

  @override
  set listGames(ObservableFuture<List<GameModel>> value) {
    _$listGamesAtom.reportWrite(value, super.listGames, () {
      super.listGames = value;
    });
  }

  late final _$listPlataformAtom =
      Atom(name: '_HomeStoreBase.listPlataform', context: context);

  @override
  ObservableFuture<List<PlataformModel>> get listPlataform {
    _$listPlataformAtom.reportRead();
    return super.listPlataform;
  }

  @override
  set listPlataform(ObservableFuture<List<PlataformModel>> value) {
    _$listPlataformAtom.reportWrite(value, super.listPlataform, () {
      super.listPlataform = value;
    });
  }

  late final _$getPlataformsHomeAsyncAction =
      AsyncAction('_HomeStoreBase.getPlataformsHome', context: context);

  @override
  Future<void> getPlataformsHome() {
    return _$getPlataformsHomeAsyncAction.run(() => super.getPlataformsHome());
  }

  late final _$getScreenshotAsyncAction =
      AsyncAction('_HomeStoreBase.getScreenshot', context: context);

  @override
  Future<bool> getScreenshot({int? idScreenshot}) {
    return _$getScreenshotAsyncAction
        .run(() => super.getScreenshot(idScreenshot: idScreenshot));
  }

  @override
  String toString() {
    return '''
listGames: ${listGames},
listPlataform: ${listPlataform}
    ''';
  }
}
