// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';
import 'package:mobx/mobx.dart';
import 'package:sua_musica_teste/features/home/data/datasources/localstorage/home_cache_images.dart';
import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_games_by_plataforms.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_screenshot_by_game.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/save_image_in_cache_usecase.dart';
import 'package:sua_musica_teste/main.dart';
import 'package:sua_musica_teste/shared/constants/constants.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPlataforms getPlataforms;
  final GetGameByPlataform gameByPlataform;
  final GetScreenshotUseCase getScreenshotUseCase;
  final SaveImageInCacheUseCase saveImageInCacheUseCase;
  final HomeCacheImage homeCacheImage;

  @observable
  ObservableFuture<List<GameModel>> listGames = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<PlataformModel>> listPlataform =
      ObservableFuture.value([]);

  _HomeStoreBase({
    required this.getPlataforms,
    required this.gameByPlataform,
    required this.getScreenshotUseCase,
    required this.homeCacheImage,
    required this.saveImageInCacheUseCase,
  }) {
    getPlataformsHome();
  }

  @action
  Future<void> getPlataformsHome() async {
    listPlataform = getPlataforms.call().asObservable();
  }

  Future<void> getGamesByPlataforms({required int id}) async {
    listGames = gameByPlataform.call(idPlataform: id).asObservable();
  }

  @action
  Future<bool> getScreenshot({int? idScreenshot}) async {
    try {
      String emptyImage = "https://sindilojaslc.com.br/Imagens/img.jpg";
      if (idScreenshot == null) {
        await saveImageInCacheUseCase.call(
          id: Constants.idEmptyImage,
          urlImage: emptyImage,
        );
        return true;
      }
      var result = await getScreenshotUseCase.call(idScreenshot: idScreenshot);
      String idImage = result.first.image_id!;
      String urlImage =
          "https://images.igdb.com/igdb/image/upload/t_screenshot_med/$idImage.jpg";
      await saveImageInCacheUseCase.call(id: idScreenshot, urlImage: urlImage);
      return true;
    } catch (e) {      
      throw Exception('NoConnected');      
    }
  }

  Future<Uint8List> getImageCache({required int id}) async {
    return homeCacheImage.getCache(id: id);
  }
}
