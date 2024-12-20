// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class StaffHomepage extends StatelessWidget {
  const StaffHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: Text("Staff"))],
      ),
    );
  }
}
