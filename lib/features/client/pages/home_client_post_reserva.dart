
import 'package:flutter/material.dart';
import 'package:reserva_restaurant/core/utils/notificaciones.dart';
import 'package:reserva_restaurant/features/auth/user.dart';
import 'package:reserva_restaurant/features/client/pages/card_reservacion.dart';
import 'package:reserva_restaurant/features/client/widgets/user_info.dart';

class HomePageClientPosReserva extends StatefulWidget {
  const HomePageClientPosReserva({super.key});

  @override
  State<HomePageClientPosReserva> createState() =>
      _HomePageClientPosReservaState();
}

class _HomePageClientPosReservaState extends State<HomePageClientPosReserva> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BuildUserInfo(userName: currentUser.name),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          //! Botón de cerrar sesión
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout, color: Colors.black),
          ),
        ],
      ),
      body: const _MainContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardReservacion(
            date: 'Nov 19, 2024',
            time: '5:00 PM',
            peopleCount: 4,
            onDelete: () {
              //! Lógica para eliminar
            },
            onEdit: () {
              //! Lógica para editar
            },
            onNotify: () {
              MostarNotificacion(
                context,
                'Recordatorio',
                'Tienes una reservación a las 5:00 PM',
              );
            },
          ),
        ],
      ),
    );
  }
}