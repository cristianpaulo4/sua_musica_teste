import 'package:sua_musica_teste/features/home/data/models/plataform_model.dart';
import '../repositories/home_repository.dart';

class GetPlataforms {
  final HomeRepository homeRepository;
  GetPlataforms({
    required this.homeRepository,
  });

  Future<List<PlataformModel>> call() async{
    return await homeRepository.getAllPlataforms();
  }  
}
