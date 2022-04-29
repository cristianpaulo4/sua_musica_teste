// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sua_musica_teste/features/home/domain/repositories/home_repository.dart';
import '../../data/models/screnshot_model.dart';

class GetScreenshotUseCase {
  final HomeRepository repository;
  GetScreenshotUseCase({
    required this.repository,
  });
  
  Future<List<ScreenshotModel>> call({required int idScreenshot }) async{
    return await repository.getScreenshotByGame(idScrenshot: idScreenshot);
  }
}
