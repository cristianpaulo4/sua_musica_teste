// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:sua_musica_teste/features/details/domain/usecases/get_genere_by_game_usecase.dart';
import 'package:sua_musica_teste/features/details/domain/usecases/get_plataforms_usecase.dart';
import '../../../home/data/models/game_model.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  final GetGenereByGameUseCase genereByGameUseCase;
  final GetPlataformsUseCase getPlataformsUseCase;
  _DetailsStoreBase({
    required this.genereByGameUseCase,
    required this.getPlataformsUseCase,
  });

  @observable
  String genere = "";

  @observable
  String plataforms = "";

  Future init({required GameModel gameModel}) async {
    if (gameModel.genres != null) {
      getGenere(listIds: gameModel.genres!);
    }
    if (gameModel.platforms != null) {
      getPlataforms(listIds: gameModel.platforms!);
    }
  }

  Future<void> getGenere({required List<int> listIds}) async {
    var result = await genereByGameUseCase.call(listId: listIds);
    List<String> listGenere = result.map((e) => e.name!).toList();
    genere = listGenere.toString().replaceAll("[", "").replaceAll("]", "");
  }

  Future<void> getPlataforms({required List<int> listIds}) async {
    var result = await getPlataformsUseCase.call(listId: listIds);
    List<String> listPlataforms = result.map((e) => e.name!).toList();
    plataforms =
        listPlataforms.toString().replaceAll("[", "").replaceAll("]", "");
  }
}
