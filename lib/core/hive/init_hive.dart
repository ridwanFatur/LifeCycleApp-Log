import 'package:hive_flutter/hive_flutter.dart';
import 'hive_key.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  // Open Box to store data
  await Hive.openBox(HiveKey.lifeCycleList);
}
