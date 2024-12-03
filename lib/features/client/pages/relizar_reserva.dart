import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/auth/user.dart';
import 'package:reserva_restaurant/features/client/pages/reserva_realizada.dart';
import 'package:reserva_restaurant/features/client/widgets/relizar_pedido_button.dart';
import 'package:reserva_restaurant/features/client/widgets/reservar_cards.dart';
import 'package:reserva_restaurant/features/client/widgets/user_info.dart';

class RealizarPedidoPage extends StatefulWidget {
  const RealizarPedidoPage({super.key});

  @override
  State<RealizarPedidoPage> createState() => _RealizarPedidoPageState();
}

class _RealizarPedidoPageState extends State<RealizarPedidoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BuildUserInfo(userName: currentUser.name),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          // Botón de cerrar sesión
          IconButton(
            onPressed: () {
              // Lógica para cerrar sesión
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
class _MainContent extends StatefulWidget {
  const _MainContent();

  @override
  State<_MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<_MainContent> {
  String? selectedDay;
  String? selectedTime;
  int? selectedPeople;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset(
                'assets/images/restaurantes.png',
                fit: BoxFit.contain,
              ),
            ),
            ReservacionCards(
              onSelectionChanged: (day, time, people) {
                setState(() {
                  selectedDay = day;
                  selectedTime = time;
                  selectedPeople = people;
                });
              },
            ),
            const SizedBox(height: 30),
            RealizarPedidoButton(
              size: size,
              selectedDay: selectedDay,
              selectedTime: selectedTime,
              selectedPeople: selectedPeople,
              onSuccess: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReservaRealizada()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
