import 'package:flutter/material.dart';

class ContenidoReserva extends StatelessWidget {
  const ContenidoReserva({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Por favor complete los detalles de su reserva y luego elija la tabla del mapa de arriba.",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
