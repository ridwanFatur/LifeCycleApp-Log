import 'package:flutter/material.dart';
import 'package:my_lifecycleapp/core/utils/navigation.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is Second Screen"),
            ElevatedButton(
              onPressed: () {
                Navigation.back();
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}
