// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';

import '../../../../../main.dart';

class DetailsImplServices extends DetailsServices {
  final Dio http;
  DetailsImplServices({
    required this.http,
  });
  @override
  Future<List<Map<String, dynamic>>> getGenereByGame(
      {required List<int> listId}) async {
    String keyName = "$listId";
    List<Map<String, dynamic>> list = [];
    try {
      String ids = listId.toString().replaceAll("[", "(").replaceAll("]", ")");
      Response res = await http.post('https://api.igdb.com/v4/genres',
          options: Options(
            headers: mainHeader,
          ),
          data: "fields name ; where id = $ids ;");
      list = List.from(res.data);
      box.put(keyName, list);
      return list;
    } catch (e) {
      List? res = await box.get(keyName);
      if (res != null) {
        var localStorage = List<Map<dynamic, dynamic>>.from(res);
        list = localStorage.map((e) => Map<String, dynamic>.from(e)).toList();
      }
      return list;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getPlataforms(
      {required List<int> listId}) async {
    String keyName = "$listId";
    List<Map<String, dynamic>> list = [];
    try {
      String ids = listId.toString().replaceAll("[", "(").replaceAll("]", ")");
      Response res = await http.post('https://api.igdb.com/v4/platforms',
          options: Options(
            headers: mainHeader,
          ),
          data: "fields name ; where id = $ids ;");
      list = List.from(res.data);
      box.put(keyName, list);
      return list;
    } catch (e) {
      List? res = await box.get(keyName);
      if (res != null) {
        var localStorage = List<Map<dynamic, dynamic>>.from(res);
        list = localStorage.map((e) => Map<String, dynamic>.from(e)).toList();
      }
      return list;
    }
  }
}
