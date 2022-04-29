import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/game_model.dart';
import '../store/home_store.dart';

class ItemGamer extends StatelessWidget {
  final GameModel gameModel;

  final Function() onTap;
  const ItemGamer({Key? key, required this.onTap, required this.gameModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 4,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder<String>(
              future: context.read<HomeStore>().getScreenshot(
                    idScreenshot: gameModel.screenshots?.first,
                  ),
              builder: (context, url) {
                if (url.hasData) {
                  return Flexible(
                    child: Image.network(
                      url.data!,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.image_not_supported,
                        color: Colors.black12,
                        size: 100,
                      ),
                    ),
                  );
                }
                if (url.hasError) {
                  return const Icon(
                    Icons.image_not_supported,
                    color: Colors.black12,
                    size: 100,
                  );
                }
                return const CircularProgressIndicator();
              },
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
