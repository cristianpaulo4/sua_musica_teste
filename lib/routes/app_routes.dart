import 'package:flutter/material.dart';

import '../features/details/presentation/pages/details_page.dart';
import '../features/home/data/models/game_model.dart';

abstract class AppRoutes {
  static String datails = "/details";

  static Map<String, WidgetBuilder> routes = {
    datails: (context){
      var game = ModalRoute.of(context)!.settings.arguments as GameModel;
      return DatailsPage(gameModel: game);
    },
  };
}
