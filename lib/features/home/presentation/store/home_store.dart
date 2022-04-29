// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:sua_musica_teste/features/home/data/models/game_model.dart';

import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_games_by_plataforms.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_screenshot_by_game.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final GetPlataforms getPlataforms;
  final GetGameByPlataform gameByPlataform;
  final GetScreenshotUseCase getScreenshotUseCase;

  @observable
  ObservableFuture<List<GameModel>> listGames = ObservableFuture.value([]);

  @observable
  ObservableFuture<List<PlataformModel>> listPlataform =
      ObservableFuture.value([]);

  _HomeStoreBase({
    required this.getPlataforms,
    required this.gameByPlataform,
    required this.getScreenshotUseCase,
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
  Future<String> getScreenshot({int? idScreenshot}) async {
    String emptyImage = "https://sindilojaslc.com.br/Imagens/img.jpg";

    if (idScreenshot == null) {
      return emptyImage;
    }
    var result = await getScreenshotUseCase.call(idScreenshot: idScreenshot);
    String idImage = result.first.image_id!;
    String urlImage =
        "https://images.igdb.com/igdb/image/upload/t_screenshot_med/$idImage.jpg";
    return urlImage;
  }
}
