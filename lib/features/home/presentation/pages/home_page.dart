import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_teste/features/home/presentation/store/home_store.dart';
import 'package:sua_musica_teste/features/home/presentation/widgets/item_gamer.dart';
import 'package:mobx/src/api/async.dart';
import 'package:sua_musica_teste/features/home/presentation/widgets/section_plataforms.dart';
import 'package:sua_musica_teste/routes/app_routes.dart';
import 'package:sua_musica_teste/shared/widgets/error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeStore homeStore;

  @override
  void initState() {
    homeStore = context.read<HomeStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Game Lovers App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                if (homeStore.listPlataform.status == FutureStatus.rejected) {
                  return const ErrorPage();
                }
                if (homeStore.listPlataform.status == FutureStatus.pending) {
                  return const Center(
                    child: LinearProgressIndicator(),
                  );
                }
                var listPlataforms = homeStore.listPlataform.value;
                homeStore.getGamesByPlataforms(id: listPlataforms!.first.id!);
                return SectionPlataforms(
                  listPlataforms: listPlataforms,
                  vsync: this,
                  onSelect: (id) => homeStore.getGamesByPlataforms(id: id),
                );
              },
            ),
            Observer(builder: (_) {
              if (homeStore.listGames.status == FutureStatus.rejected) {
                return const ErrorPage();
              }

              if (homeStore.listGames.status == FutureStatus.pending) {
                return const Center(
                  child: CircularProgressIndicator(),
                );                
              }
              var listGames = homeStore.listGames.value;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    mainAxisExtent: 230,
                  ),
                  itemCount: listGames!.length,
                  itemBuilder: (_, i) {
                    return ItemGamer(
                      gameModel: listGames.elementAt(i),
                      onTap: () {                        
                        Navigator.pushNamed(
                          context,
                          AppRoutes.datails,
                          arguments: listGames.elementAt(i),
                        );
                      },
                    );
                  },
                ),
              );
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
