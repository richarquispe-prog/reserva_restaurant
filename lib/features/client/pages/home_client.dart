import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/auth/user.dart';
import 'package:reserva_restaurant/features/client/pages/relizar_reserva.dart';
import 'package:reserva_restaurant/features/client/widgets/button_reelizarpedido_inico.dart';
import 'package:reserva_restaurant/features/client/widgets/contenido_bienvenida.dart';
import 'package:reserva_restaurant/features/client/widgets/user_info.dart'; 

class HomePageClient extends StatefulWidget {
  const HomePageClient({super.key});

  @override
  State<HomePageClient> createState() => _HomePageClientState();
}

class _HomePageClientState extends State<HomePageClient> {

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

class _MainContent extends StatelessWidget {
  const _MainContent();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const ContenidoBienvenida(),
          RealizarPedidoButton(
              size: size,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RealizarPedidoPage()),
                );
              },
            ),
        ],
      ),
    );
  }
}

