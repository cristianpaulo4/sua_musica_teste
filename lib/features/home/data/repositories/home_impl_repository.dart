import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/data/models/screnshot_model.dart';
import 'package:sua_musica_teste/features/home/domain/repositories/home_repository.dart';
import 'package:sua_musica_teste/features/home/domain/services/home_services.dart';

import '../../../../main.dart';
import '../../../../shared/utils/list_dynamic_to_list_map.dart';

class HomeImplRepository implements HomeRepository {
  final HomeService plataformService;
  HomeImplRepository({
    required this.plataformService,
  });
  @override
  Future<List<PlataformModel>> getAllPlataforms() async {
    List<Map<String, dynamic>> list = [];
    String keyName = "homePlataforms";
    try {
      list = await plataformService.getAllPlataforms();
      box.put(keyName, list);
    } catch (e) {
      // get local storage
      List localStorage = await box.get(keyName);
      list = ListDymanicToListMap.convert(localStorage);
    }
    return list.map((e) => PlataformModel.fromJson(e)).toList();
  }

  @override
  Future<List<GameModel>> getGamesByPlataforms(
      {required int idPlataforms}) async {
    String keyName = "$idPlataforms";
    List<Map<String, dynamic>> list = [];
    try {
      list = await plataformService.getGamesByPlataforms(
        idPlataforms: idPlataforms,
      );
      box.put(keyName, list);
    } catch (e) {
      // get local storage
      List localStorage = await box.get(keyName);
      list = ListDymanicToListMap.convert(localStorage);
    }
    return list.map((e) => GameModel.fromJson(e)).toList();
  }

  @override
  Future<List<ScreenshotModel>> getScreenshotByGame(
      {required int idScrenshot}) async {
    List<Map<String, dynamic>> list =
        await plataformService.getScreenshotByGame(
      idScreenshot: idScrenshot,
    );
    return list.map((e) => ScreenshotModel.fromJson(e)).toList();
  }

  @override
  Future<void> saveImageInCache(
      {required int id, required String urlImage}) async {
    await plataformService.saveImageInCache(
      id: id,
      urlImage: urlImage,
    );
  }
}
