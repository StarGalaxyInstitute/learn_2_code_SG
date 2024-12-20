// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ParentsHomepage extends StatelessWidget {
  const ParentsHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Parents"))],
      ),
    );
  }
}
