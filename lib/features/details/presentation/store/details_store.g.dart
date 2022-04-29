// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsStore on _DetailsStoreBase, Store {
  late final _$genereAtom =
      Atom(name: '_DetailsStoreBase.genere', context: context);

  @override
  String get genere {
    _$genereAtom.reportRead();
    return super.genere;
  }

  @override
  set genere(String value) {
    _$genereAtom.reportWrite(value, super.genere, () {
      super.genere = value;
    });
  }

  late final _$plataformsAtom =
      Atom(name: '_DetailsStoreBase.plataforms', context: context);

  @override
  String get plataforms {
    _$plataformsAtom.reportRead();
    return super.plataforms;
  }

  @override
  set plataforms(String value) {
    _$plataformsAtom.reportWrite(value, super.plataforms, () {
      super.plataforms = value;
    });
  }

  @override
  String toString() {
    return '''
genere: ${genere},
plataforms: ${plataforms}
    ''';
  }
}
