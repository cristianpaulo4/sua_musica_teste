import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sua_musica_teste/features/details/data/repositories/details_impl_repository.dart';
import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';
import 'package:sua_musica_teste/features/details/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/features/details/data/models/plataform_model.dart';
import 'package:sua_musica_teste/settings/settings.dart';
import 'get_generer_test.mocks.dart';
import 'mock/details_mock.dart';

@GenerateMocks([DetailsServices])
void main() async {
  await SettingsInitial.init();
  late final GetPlataformsUseCase getPlataformsUseCase;
  late final MockDetailsServices services;
  

  setUp(() {
    services = MockDetailsServices();
    getPlataformsUseCase = GetPlataformsUseCase(
      repository: DetailsImplRepository(services: services),
    );
    
  });


  test("Get plataforms", () async{
    when(services.getPlataforms(listId: [0,1])).thenAnswer((_) async => DetailsMock.plataforms );
    var mock = DetailsMock.plataforms.map((e) => PlataformModel.fromJson(e)).toList();
    var result = await getPlataformsUseCase.call(
      listId: [0,1]
    );
    expect(result, mock);
   
  });




}
