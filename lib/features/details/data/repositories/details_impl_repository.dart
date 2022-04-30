// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/details/data/models/genere_model.dart';
import 'package:sua_musica_teste/features/details/domain/repositories/details_repository.dart';
import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';

import '../../../../main.dart';
import '../../../../shared/utils/list_dynamic_to_list_map.dart';
import '../models/plataform_model.dart';

class DetailsImplRepository extends DetailsRepository {
  final DetailsServices services;

  DetailsImplRepository({
    required this.services,
  });
  @override
  Future<List<GenereModel>> getGenereByGame({required List<int> listId}) async {
    String keyName = "$listId";
    List<Map<String, dynamic>> result = [];
    try {
      result = await services.getGenereByGame(listId: listId);
      box.put(keyName, result);
    } catch (e) {
      // get local storage
      List? res = await box.get(keyName);
      if (res != null) {
        var localStorage = List.from(res);
        result = ListDymanicToListMap.convert(localStorage);
      }
    }
    return result.map((e) => GenereModel.fromJson(e)).toList();
  }

  @override
  Future<List<PlataformModel>> getPlataforms(
      {required List<int> listId}) async {
    String keyName = "$listId";
    List<Map<String, dynamic>> result = [];

    try {
      result = await services.getPlataforms(
        listId: listId,
      );
      box.put(keyName, result);
    } catch (e) {
      // get local storage
      List? res = await box.get(keyName);
      if (res != null) {
        var localStorage = List.from(res);
        result = ListDymanicToListMap.convert(localStorage);
      }     
    }
    return result.map((e) => PlataformModel.fromJson(e)).toList();
  }
}
