import 'package:flutter/material.dart';

class NoScreenPage extends StatelessWidget {
  const NoScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Please select a screen to continue",
        ),
      ),
    );
  }
}
