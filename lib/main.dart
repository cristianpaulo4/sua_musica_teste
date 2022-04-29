import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:sua_musica_teste/factory/home/details_factory_repository.dart';
import 'package:sua_musica_teste/factory/home/home_factory_repository.dart';
import 'package:sua_musica_teste/features/details/domain/usecases/get_genere_by_game_usecase.dart';
import 'package:sua_musica_teste/features/details/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/features/details/presentation/store/details_store.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_games_by_plataforms.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_plataforms_usecase.dart';
import 'package:sua_musica_teste/features/home/domain/usecases/get_screenshot_by_game.dart';
import 'package:sua_musica_teste/features/home/presentation/store/home_store.dart';
import 'package:sua_musica_teste/routes/app_routes.dart';
import 'features/home/presentation/pages/home_page.dart';

Map<String, dynamic> mainHeader = {
  "Client-ID": "hwp41oifvpnoo5snws42h0g1b39uxx",
  "Authorization": "Bearer q9l60y4vc9ftkjtv4qwzzkg84kdji1"
};

late Box box;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocDir = await getTemporaryDirectory();
  Hive.init(appDocDir.path);
  box = await Hive.openBox('db');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeStore>(
          create: (_) => HomeStore(
              gameByPlataform: GetGameByPlataform(
                homeRepository: HomeFactoryRepository.repository,
              ),
              getPlataforms: GetPlataforms(
                homeRepository: HomeFactoryRepository.repository,
              ),
              getScreenshotUseCase: GetScreenshotUseCase(
                repository: HomeFactoryRepository.repository,
              )),
        ),
        Provider<DetailsStore>(
          create: (_) => DetailsStore(
              genereByGameUseCase: GetGenereByGameUseCase(
                repository: DetailsFactoryRepository.repository,
              ),
              getPlataformsUseCase: GetPlataformsUseCase(
                repository: DetailsFactoryRepository.repository,
              )),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: const HomePage(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
