import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/home/presentation/store/home_store.dart';

class ImageCacheApp extends StatelessWidget {
  final int id;
  const ImageCacheApp({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: context.read<HomeStore>().getImageCache(id: id),
      builder: (context, bytes) {
        if (bytes.hasData) {
          return Image.memory(bytes.data!);
        }
        return Container();
      },
    );
  }
}
