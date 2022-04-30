abstract class ListDymanicToListMap {
  static List<Map<String, dynamic>> convert(List list) {
    return list.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
