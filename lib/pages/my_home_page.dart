import 'package:flutter/material.dart';
import '../src/core/flavors.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppFlavour.title),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'Hello ${AppFlavour.title}',
            ),
          ),
          TextButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ],
      ),
    );
  }
}
