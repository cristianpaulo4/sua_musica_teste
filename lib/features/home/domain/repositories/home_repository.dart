import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/data/models/screnshot_model.dart';

abstract class HomeRepository {
  Future<List<PlataformModel>> getAllPlataforms();
  Future<List<GameModel>> getGamesByPlataforms({required int idPlataforms});
  Future<List<ScreenshotModel>> getScreenshotByGame({required int idScrenshot});
  
}
