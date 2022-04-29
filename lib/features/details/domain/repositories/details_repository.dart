import 'package:sua_musica_teste/features/details/data/models/genere_model.dart';
import 'package:sua_musica_teste/features/details/data/models/plataform_model.dart';


abstract class DetailsRepository {
  Future<List<GenereModel>> getGenereByGame({required List<int> listId});
  Future<List<PlataformModel>> getPlataforms({required List<int> listId});
  
}