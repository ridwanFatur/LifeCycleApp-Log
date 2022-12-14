import 'package:flutter/material.dart';
import 'package:my_lifecycleapp/core/app_routes.dart';
import 'package:my_lifecycleapp/core/types/network_result.dart';
import 'package:my_lifecycleapp/core/utils/navigation.dart';
import 'package:my_lifecycleapp/presentation/first_screen/first_screen_notifier.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    notifierInitState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    context.read<FirstScreenNotifier>().addData(state);
  }

  void notifierInitState() async {
    await Future.delayed(const Duration(seconds: 0)).then((_) {
      context.read<FirstScreenNotifier>().initState();
      WidgetsBinding.instance.addObserver(this);
      if (WidgetsBinding.instance.lifecycleState != null) {
        context
            .read<FirstScreenNotifier>()
            .addData(WidgetsBinding.instance.lifecycleState!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Material(
              color: Colors.white,
              elevation: 10,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Wrap(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<FirstScreenNotifier>().loadAllData();
                      },
                      child: const Text("Refresh"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        context.read<FirstScreenNotifier>().deleteAllItem();
                      },
                      child: const Text("Clear All Data"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigation.intent(AppRoutes.kSecondScreen);
                      },
                      child: const Text("Go to Another Page"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Selector<FirstScreenNotifier, NetworkResult<List<String>>>(
                  selector: (_, state) => state.networkResult,
                  builder: (context, networkResult, _) {
                    if (networkResult is ResultHasData) {
                      List<String> data = networkResult.data!;
                      return ListView(
                        children: List.generate(data.length, (index) {
                          String item = data[index];
                          return Container(
                            color: Colors.green,
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      );
                    }

                    return Container();
                  }),
            ),
            FutureBuilder(
              future:
                  Future<String>.delayed(const Duration(seconds: 0), () async {
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                String version = packageInfo.version;
                return version;
              }),
              builder: (context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    width: double.infinity,
                    color: Colors.grey.withOpacity(0.2),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      snapshot.data ?? "V",
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
