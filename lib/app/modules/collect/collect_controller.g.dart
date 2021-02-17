// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collect_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CollectController on _CollectControllerBase, Store {
  final _$placeListAtom = Atom(name: '_CollectControllerBase.placeList');

  @override
  ObservableStream<List<PlaceModel>> get placeList {
    _$placeListAtom.reportRead();
    return super.placeList;
  }

  @override
  set placeList(ObservableStream<List<PlaceModel>> value) {
    _$placeListAtom.reportWrite(value, super.placeList, () {
      super.placeList = value;
    });
  }

  final _$_CollectControllerBaseActionController =
      ActionController(name: '_CollectControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_CollectControllerBaseActionController.startAction(
        name: '_CollectControllerBase.getList');
    try {
      return super.getList();
    } finally {
      _$_CollectControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
placeList: ${placeList}
    ''';
  }
}
