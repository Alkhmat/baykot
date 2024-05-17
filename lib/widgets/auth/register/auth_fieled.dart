import 'package:flutter/material.dart';

class AuthTextFieled extends StatelessWidget {
  const AuthTextFieled({
    super.key,
    required this.h,
    this.labelText,
    this.controller,
    this.onTap,
  });

  final double h;
  final String? labelText;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        controller: controller,
        readOnly: onTap != null,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white, fontSize: h * 0.025),
          labelText: labelText,
        ),
        onTap: onTap,
      ),
    );
  }
}
