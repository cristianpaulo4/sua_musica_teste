import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_teste/shared/constants/constants.dart';

import '../../../../shared/widgets/image_cache.dart';
import '../../data/models/game_model.dart';
import '../store/home_store.dart';

class ItemGamer extends StatelessWidget {
  final GameModel gameModel;

  final Function() onTap;
  const ItemGamer({Key? key, required this.onTap, required this.gameModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? idImg = gameModel.screenshots?.first;
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 4,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: FutureBuilder<bool>(
                future: context.read<HomeStore>().getScreenshot(
                      idScreenshot: idImg,
                    ),
                builder: (context, read) {
                  if (read.hasData) {
                    return idImg != null
                        ? ImageCacheApp(id: idImg)
                        : ImageCacheApp(id: Constants.idEmptyImage);
                  }
                  if (read.hasError) {
                    return idImg != null
                        ? ImageCacheApp(id: idImg)
                        : ImageCacheApp(id: Constants.idEmptyImage);
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Text(
              gameModel.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
