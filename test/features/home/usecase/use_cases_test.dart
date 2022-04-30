import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import 'package:sua_musica_teste/features/home/data/repositories/home_impl_repository.dart';
import 'package:sua_musica_teste/features/home/domain/services/home_services.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_games_by_plataforms.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/settings/settings.dart';
import 'mock/home_mock.dart';
import 'use_cases_test.mocks.dart';

@GenerateMocks([HomeService])
void main() async {
  await SettingsInitial.init();
  late GetPlataforms getPlataforms;
  late GetGameByPlataform getGameByPlataform;
  late MockHomeService service;

  setUp(
    () {
      service = MockHomeService();
      final repository = HomeImplRepository(
        plataformService: service,
      );

      getPlataforms = GetPlataforms(homeRepository: repository);
      getGameByPlataform = GetGameByPlataform(homeRepository: repository);
    },
  );

  test("Get plataforms", () async {
    when(service.getAllPlataforms())
        .thenAnswer((_) async => HomeMock.responsePlataforms);
    var list = HomeMock.responsePlataforms
        .map((e) => PlataformModel.fromJson(e))
        .toList();
    var res = await getPlataforms.call();
    expect(res, list);
  });

  test("Get Games by plataform", () async {
    when(service.getGamesByPlataforms(idPlataforms: 8)).thenAnswer(
      (_) async => HomeMock.responseGames,
    );
    var listGames =
        HomeMock.responseGames.map((e) => GameModel.fromJson(e)).toList();
    var res = await getGameByPlataform.call(idPlataform: 8);
    expect(res, listGames);
  });
}
