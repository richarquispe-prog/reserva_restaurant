import 'package:flutter/material.dart';

Future<bool> showConfirmationDialog(
    BuildContext context, String title, String message) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), // Cancelar
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // Confirmar
            child: const Text("Confirmar"),
          ),
        ],
      );
    },
  ) ?? false; 
}
