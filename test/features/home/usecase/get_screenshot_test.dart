import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sua_musica_teste/features/home/data/models/screnshot_model.dart';
import 'package:sua_musica_teste/features/home/data/repositories/home_impl_repository.dart';
import 'package:sua_musica_teste/features/home/domain/services/home_services.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_screenshot_by_game.dart';

import 'mock/home_mock.dart';
import 'use_cases_test.mocks.dart';

@GenerateMocks([HomeService])
void main() {
  late GetScreenshotUseCase getScreenshotUseCase;

  setUp(() {
    final services = MockHomeService();
    getScreenshotUseCase = GetScreenshotUseCase(
      repository: HomeImplRepository(
        plataformService: services,
      ),
    );

    when(services.getScreenshotByGame(idScreenshot: 0))
        .thenAnswer((_) async => HomeMock.responseGetScreenshotByGame);
  });

  test("Get screenshot by game", () async {
    var list = HomeMock.responseGetScreenshotByGame
        .map((e) => ScreenshotModel.fromJson(e))
        .toList();
    var res = await getScreenshotUseCase.call(idScreenshot: 0);
    expect(res, list);
  });
}
