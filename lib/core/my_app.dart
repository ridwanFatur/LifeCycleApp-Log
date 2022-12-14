import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_lifecycleapp/injection.dart';
import 'package:my_lifecycleapp/presentation/global_states/main_global_notifier.dart';
import 'package:provider/provider.dart';
import 'constants/strings.dart';
import 'style/app_theme.dart';
import 'utils/navigation.dart';
import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // set orientation
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );

    return MultiProvider(
       providers: [
        ChangeNotifierProvider<MainGlobalNotifier>(create: (_) => locator<MainGlobalNotifier>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(300, 400),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: Strings.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            navigatorKey: navigatorKey,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
