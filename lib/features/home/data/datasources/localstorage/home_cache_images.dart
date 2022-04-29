import 'dart:typed_data';

abstract class HomeCacheImage {
  void cache({required int id, required Uint8List bytes});
  Uint8List getCache({required int id});
}
