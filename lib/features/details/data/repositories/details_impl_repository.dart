// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/details/data/models/genere_model.dart';
import 'package:sua_musica_teste/features/details/domain/repositories/details_repository.dart';
import 'package:sua_musica_teste/features/details/domain/services/details_services.dart';

import '../models/plataform_model.dart';

class DetailsImplRepository extends DetailsRepository {
  final DetailsServices services;
  DetailsImplRepository({
    required this.services,
  });
  @override
  Future<List<GenereModel>> getGenereByGame({required List<int> listId}) async {
    List<Map<String, dynamic>> resul = await services.getGenereByGame(
      listId: listId,
    );
    return resul.map((e) => GenereModel.fromJson(e)).toList();
  }

  @override
  Future<List<PlataformModel>> getPlataforms({required List<int> listId}) async {
    List<Map<String, dynamic>> resul = await services.getPlataforms(
      listId: listId,
    );
    return resul.map((e) => PlataformModel.fromJson(e)).toList();
  }
}
