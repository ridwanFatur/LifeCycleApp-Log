import '../presentation/first_screen/first_screen.dart';
import '../presentation/first_screen/first_screen_notifier.dart';

import '../presentation/second_screen/second_screen.dart';
import '../presentation/second_screen/second_screen_notifier.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../injection.dart' as di;

class AppRoutes {
  static const String kFirstScreen = "first-screen";
  static const String kSecondScreen = "second-screen";

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<FirstScreenNotifier>(
                  create: (context) => di.locator<FirstScreenNotifier>(),
                ),
              ],
              child: const FirstScreen(),
            );
          },
        );
      case kSecondScreen:
        return MaterialPageRoute(
          builder: (context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<SecondScreenNotifier>(
                  create: (context) => di.locator<SecondScreenNotifier>(),
                ),
              ],
              child: const SecondScreen(),
            );
          },
        );

      default:
        return MaterialPageRoute(builder: ((context) => Container()));
    }
  }
}
