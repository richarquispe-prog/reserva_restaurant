import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/client/pages/home_client_post_reserva.dart';
import 'package:reserva_restaurant/features/client/widgets/mensaje_exitoso.dart';
import 'package:reserva_restaurant/features/client/widgets/regresar_button.dart';

class ReservaRealizada extends StatefulWidget {
  const ReservaRealizada({super.key});

  @override
  State<ReservaRealizada> createState() => _ReservaRealizadaState();
}

class _ReservaRealizadaState extends State<ReservaRealizada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width *
                0.9, // 90% del ancho de la pantalla
            child: Image.asset(
              'assets/images/check.png',
              fit: BoxFit.contain,
            ),
          ),
          const MensajeExitoso(),
          RegresarButton(
            size: size,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePageClientPosReserva()),
              );
            },
          ),
        ],
      ),
    );
  }
}
