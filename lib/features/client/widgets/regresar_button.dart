import 'package:flutter/material.dart';

class RegresarButton extends StatelessWidget {
  const RegresarButton({
    super.key,
    required this.size,
    required this.onPressed,
  });

  final Size size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.9,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Regresar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
