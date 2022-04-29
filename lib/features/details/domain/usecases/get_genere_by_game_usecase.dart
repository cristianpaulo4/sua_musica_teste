// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/details/data/models/genere_model.dart';
import 'package:sua_musica_teste/features/details/domain/repositories/details_repository.dart';

class GetGenereByGameUseCase {
  final DetailsRepository repository;
  GetGenereByGameUseCase({
    required this.repository,
  });

  Future<List<GenereModel>> call({required List<int> listId}) async {
    return await repository.getGenereByGame(listId: listId);
  }
}
