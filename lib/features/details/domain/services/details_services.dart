abstract class DetailsServices {
  Future<List<Map<String, dynamic>>> getGenereByGame({required List<int> listId});
  Future<List<Map<String, dynamic>>> getPlataforms({required List<int> listId});
  
}