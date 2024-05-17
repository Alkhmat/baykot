import 'package:flutter/material.dart';

class AuthTextFieled extends StatelessWidget {
  const AuthTextFieled({super.key, required this.h, this.labelText});

  final double h;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white, fontSize: h * 0.025),
          labelText: labelText,
        ),
      ),
    );
  }
}
