import 'package:flutter/material.dart';
import 'core/hive/init_hive.dart';
import 'core/my_app.dart';
import 'injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init Hive local storage
  await initHive();

  // init Injector
  di.init();

  runApp(const MyApp());
}
