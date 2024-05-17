import 'package:baykot/view/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Baykot());
}

class Baykot extends StatelessWidget {
  const Baykot({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
