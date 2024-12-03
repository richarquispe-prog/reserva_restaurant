import 'package:flutter/material.dart';
import 'package:reserva_restaurant/core/utils/validar_Seleciones.dart';

class RealizarPedidoButton extends StatelessWidget {
  final Size size;
  final String? selectedDay;
  final String? selectedTime;
  final int? selectedPeople;
  final VoidCallback onSuccess;

  const RealizarPedidoButton({
    super.key,
    required this.size,
    required this.selectedDay,
    required this.selectedTime,
    required this.selectedPeople,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width * 0.8, 50),
        backgroundColor:  Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        //! Llamar a la validación antes de continuar
        ReservacionesValidator.validateSelections(
          context: context,
          selectedDay: selectedDay,
          selectedTime: selectedTime,
          selectedPeople: selectedPeople,
          onSuccess: onSuccess,
        );
      },
      child: const Text("Realizar Pedido",style:  TextStyle(color: Colors.white)),
    );
  }
}
