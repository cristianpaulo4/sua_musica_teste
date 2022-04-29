// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/details/domain/repositories/details_repository.dart';
import 'package:sua_musica_teste/features/details/data/models/plataform_model.dart';

class GetPlataformsUseCase {
  final DetailsRepository repository;
  GetPlataformsUseCase({
    required this.repository,
  });


  Future<List<PlataformModel>> call({required List<int> listId}) async {
    return  await repository.getPlataforms(listId: listId);
  }
  
}
