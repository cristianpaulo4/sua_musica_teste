// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/home/data/models/game_model.dart';
import 'package:sua_musica_teste/features/home/domain/repositories/home_repository.dart';

class GetGameByPlataform {
  final HomeRepository homeRepository;
  GetGameByPlataform({
    required this.homeRepository,
  });
  
   Future<List<GameModel>> call({required int idPlataform}){
     return homeRepository.getGamesByPlataforms(idPlataforms: idPlataform);
     
  } 
}
