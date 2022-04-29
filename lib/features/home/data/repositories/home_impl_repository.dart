import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/data/models/screnshot_model.dart';
import 'package:sua_musica_teste/features/home/domain/repositories/home_repository.dart';
import 'package:sua_musica_teste/features/home/domain/services/home_services.dart';

class HomeImplRepository implements HomeRepository {
  final HomeService plataformService;
  HomeImplRepository({
    required this.plataformService,
  });
  @override
  Future<List<PlataformModel>> getAllPlataforms() async {
    List<Map<String,dynamic>> res = await plataformService.getAllPlataforms(); 
    var list = res.map((e) => PlataformModel.fromJson(e)).toList();
    return list;
  }

  @override
  Future<List<GameModel>> getGamesByPlataforms({required int idPlataforms}) async {
    List<Map<String,dynamic>> res = await plataformService.getGamesByPlataforms(idPlataforms: idPlataforms); 
    var list = res.map((e) => GameModel.fromJson(e)).toList();
    return list;
  }

  @override
  Future<List<ScreenshotModel>> getScreenshotByGame({required int idScrenshot}) async {
   List<Map<String,dynamic>> res = await plataformService.getScreenshotByGame(idScreenshot: idScrenshot); 
    var list = res.map((e) => ScreenshotModel.fromJson(e)).toList();
    return list;
  }
}
