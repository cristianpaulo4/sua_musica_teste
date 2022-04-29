import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_teste/features/details/presentation/store/details_store.dart';
import 'package:sua_musica_teste/features/home/data/models/game_model.dart';

import '../../../home/presentation/store/home_store.dart';

class DatailsPage extends StatefulWidget {
  final GameModel gameModel;
  const DatailsPage({Key? key, required this.gameModel}) : super(key: key);

  @override
  State<DatailsPage> createState() => _DatailsPageState();
}

class _DatailsPageState extends State<DatailsPage> {
  late DetailsStore detailsStore;

  @override
  void initState() {
    detailsStore = context.read<DetailsStore>();
    detailsStore.init(gameModel: widget.gameModel);
    super.initState();
  }

  @override
  void dispose() {
    detailsStore.genere = "";
    detailsStore.plataforms = "";
    super.dispose();
  }

  final styleText = const TextStyle(
    fontSize: 15,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder<String>(
              future: context.read<HomeStore>().getScreenshot(
                    idScreenshot: widget.gameModel.screenshots?.first,
                  ),
              builder: (context, url) {
                if (!url.hasData) {
                  return Container(
                    height: 250,
                    color: Colors.grey.shade300,
                  );
                }
                return SizedBox(
                  height: 250,
                  child: Image.network(
                    url.data!,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.black12,
                      size: 100,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.gameModel.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return Text(
                "Generer: ${detailsStore.genere}",
                style: styleText,
              );
            }),
            const SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              return Text(
                "Platafoms: ${detailsStore.plataforms} ",
                style: styleText,
              );
            }),
            const Divider(
              color: Colors.black45,
            ),
            Text(
              widget.gameModel.summary!,
              style: styleText,
            ),
          ],
        ),
      ),
    );
  }
}
