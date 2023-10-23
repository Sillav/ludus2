import 'package:flutter/material.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "teste",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
