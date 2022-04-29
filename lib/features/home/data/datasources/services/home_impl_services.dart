// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:sua_musica_teste/features/home/domain/services/home_services.dart';

import '../../../../../main.dart';

class HomeImplServices implements HomeService {
  final Dio http;
  HomeImplServices({
    required this.http,
  });

  @override
  Future<List<Map<String, dynamic>>> getAllPlataforms() async {
    String keyName = "homePlataforms";
    List<Map<String, dynamic>> list = [];
    try {
      Response res = await http.post(
        'https://api.igdb.com/v4/platforms',
        options: Options(
          headers: mainHeader,
        ),
        data: "fields name, slug, alternative_name ;",
      );
      list = List.from(res.data);
      box.put(keyName, list);
      return list;
    } catch (e) {
      List localStorage = await box.get(keyName);
      var listResult =
          localStorage.map((e) => Map<String, dynamic>.from(e)).toList();
      return listResult;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getGamesByPlataforms(
      {required int idPlataforms}) async {
    String keyName = "$idPlataforms";
    List<Map<String, dynamic>> list = [];
    try {
      Response res = await http.post('https://api.igdb.com/v4/games',
          options: Options(
            headers: mainHeader,
          ),
          data:
              "fields slug, summary, screenshots, name, genres, platforms ; limit 30; where platforms = ($idPlataforms) ; ");
      list = List.from(res.data);
      box.put(keyName, list);
      return list;
    } catch (e) {
      List localStorage = await box.get(keyName);     
      list = localStorage.map((e) => Map<String, dynamic>.from(e)).toList();
      return list;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getScreenshotByGame(
      {required int idScreenshot}) async {
    Response res = await http.post('https://api.igdb.com/v4/screenshots',
        options: Options(
          headers: mainHeader,
        ),
        data: "fields image_id, url ;  where id = $idScreenshot ;");
    List<Map<String, dynamic>> list = List.from(res.data);
    return list;
  }
}
