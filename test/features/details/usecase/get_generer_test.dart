import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sua_musica_teste/features/details/data/models/genere_model.dart';
import 'package:sua_musica_teste/features/details/data/repositories/details_impl_repository.dart';
import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';
import 'package:sua_musica_teste/features/details/domain/usecases/get_genere_by_game_usecase.dart';
import 'package:sua_musica_teste/settings/settings.dart';

import 'get_generer_test.mocks.dart';
import 'mock/details_mock.dart';

@GenerateMocks([DetailsServices])
void main() async {
   await SettingsInitial.init();
  late GetGenereByGameUseCase getGenereByGameUseCase;
  late final MockDetailsServices services;

  setUp(() {
    services = MockDetailsServices();
    getGenereByGameUseCase = GetGenereByGameUseCase(
      repository: DetailsImplRepository(
        services: services,
      ),
    );
  });

  test("Get genere by game", () async {
    when(services.getGenereByGame(listId: [0, 1]))
        .thenAnswer((_) async => DetailsMock.genere);
    var mock = DetailsMock.genere.map((e) => GenereModel.fromJson(e)).toList();
    var result = await getGenereByGameUseCase.call(listId: [0, 1]);
    expect(result, mock);
  });
}
