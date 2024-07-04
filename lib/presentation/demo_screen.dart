import 'dart:async';
import 'package:castle_couture/presentation/b_home_page/home_page.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  late Timer _timer;
  int tSecond = 5;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        tSecond--;
      });

      if (tSecond == 0) {
        timer.cancel();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>  const HomePage(),
            ),
            (route) => false);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('App Under Construction'),
            const SizedBox(
              height: 10,
            ),
            Text('${tSecond.toString()} seconds left'),
            const SizedBox(
              height: 10,
            ),
            const Text("You'r redirecting to Dashboard"),
          ],
        ),
      ),
    );
  }
}
