import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/admin/widgets/card_historial.dart';
import 'package:reserva_restaurant/features/reservacion/data/reservacion.dart';

class HistorialAceptados extends StatefulWidget {
  const HistorialAceptados({super.key});

  @override
  State<HistorialAceptados> createState() => _HistorialAceptadosState();
}

class _HistorialAceptadosState extends State<HistorialAceptados> {
  @override
  Widget build(BuildContext context) {
    // Generar lista de reservas filtradas (las que tienen llego == true)
    final reservas = generarReservas().where((reserva) => reserva.llego).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: reservas.isEmpty
            ? const Center(
                child: Text(
                  'No hay reservas aceptadas',
                  style: TextStyle(fontSize: 18.0),
                ),
              )
            : Column(
                children: reservas.map((reserva) {
                  return CardHistorialAceptados(
                    fecha: reserva.fecha,
                    nombreCliente: reserva.nombre,
                    horaYPersonas: '${reserva.hora} - ${reserva.cantidadPersonas} personas',
                  );
                }).toList(),
              ),
      ),
    );
  }
}
