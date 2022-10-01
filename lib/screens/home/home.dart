import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin:
            const EdgeInsets.only(left: 100, right: 100, top: 0, bottom: 550),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white,
        ),
      ),
    );
  }
}
