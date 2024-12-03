import 'package:flutter/material.dart';

class RealizarPedidoButton extends StatelessWidget {
  const RealizarPedidoButton({
    super.key,
    required this.size,
    required this.onPressed, // Función para la navegación personalizada
  });

  final Size size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.9, // 90% del ancho de la pantalla
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
          "Realizar Reserva",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
