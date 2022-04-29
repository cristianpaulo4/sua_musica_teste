// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/home/domain/repositories/home_repository.dart';

class SaveImageInCacheUseCase {
  final HomeRepository repository; 
  SaveImageInCacheUseCase({
    required this.repository,
  });

  Future<void> call({required int id, required String urlImage}) async{
    await repository.saveImageInCache(id: id, urlImage: urlImage);
  }
}
