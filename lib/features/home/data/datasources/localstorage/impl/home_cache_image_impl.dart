import 'dart:typed_data';

import 'package:sua_musica_teste/features/home/data/datasources/localstorage/home_cache_images.dart';
import 'package:sua_musica_teste/main.dart';

class HomeCacheImageImpl extends HomeCacheImage {
  @override
  void cache({required int id, required Uint8List bytes}) {
    box.put(id.toString(), bytes);
  }

  @override
  Uint8List getCache({required int id}) {
    return box.get(id.toString()) as Uint8List;
  }
}
