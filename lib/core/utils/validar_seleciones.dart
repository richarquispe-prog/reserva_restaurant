import 'package:flutter/material.dart';

class ReservacionesValidator {
  
  static void validateSelections({
    required BuildContext context,
    String? selectedDay,
    String? selectedTime,
    int? selectedPeople,
    required VoidCallback onSuccess,
  }) {
    if (selectedDay == null || selectedTime == null || selectedPeople == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error"),
            content: const Text(
                "Por favor, selecciona un día, una hora y el número de personas antes de continuar."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      onSuccess();
    }
  }
}
