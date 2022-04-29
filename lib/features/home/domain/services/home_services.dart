
abstract class HomeService {
  Future<List<Map<String, dynamic>>> getAllPlataforms();
  Future<List<Map<String, dynamic>>> getGamesByPlataforms({required int idPlataforms });
  Future<List<Map<String, dynamic>>> getScreenshotByGame({required int idScreenshot });
}