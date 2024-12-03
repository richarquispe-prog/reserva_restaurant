 import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/client/widgets/notificacion.dart';

void MostarNotificacion(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: MensajeNotificacion(title: title, message: message),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
      ),
    );
  }