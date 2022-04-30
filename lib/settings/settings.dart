import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../main.dart';

abstract class SettingsInitial {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory appDocDir = await getTemporaryDirectory();
    Hive.init(appDocDir.path);
    box = await Hive.openBox('db');
  }
}
