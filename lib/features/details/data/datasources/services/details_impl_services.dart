// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';

import '../../../../../main.dart';
import '../../../../../shared/utils/list_dynamic_to_list_map.dart';

class DetailsImplServices extends DetailsServices {
  final Dio http;
  DetailsImplServices({
    required this.http,
  });
  @override
  Future<List<Map<String, dynamic>>> getGenereByGame(
      {required List<int> listId}) async {
    String ids = listId.toString().replaceAll("[", "(").replaceAll("]", ")");
    Response res = await http.post(
      'https://api.igdb.com/v4/genres',
      options: Options(headers: mainHeader),
      data: "fields name ; where id = $ids ;",
    );
    return List.from(res.data);
  }

  @override
  Future<List<Map<String, dynamic>>> getPlataforms({
    required List<int> listId,
  }) async {
    String ids = listId.toString().replaceAll("[", "(").replaceAll("]", ")");
    Response res = await http.post('https://api.igdb.com/v4/platforms',
        options: Options(headers: mainHeader),
        data: "fields name ; where id = $ids ;");
    return List.from(res.data);
  }
}
