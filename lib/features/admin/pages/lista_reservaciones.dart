import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/admin/widgets/cards_reservaciones.dart';
import 'package:reserva_restaurant/features/reservacion/data/reservacion.dart';

class ListaReservaciones extends StatefulWidget {
  const ListaReservaciones({super.key});

  @override
  State<ListaReservaciones> createState() => _ListaReservacionesState();
}

class _ListaReservacionesState extends State<ListaReservaciones> {
  final List<Reserva> reservas = generarReservas();
  String? horaSeleccionada = "Todos"; //! Por defecto, selecciona "Todos"

  //! Función para filtrar reservas por hora seleccionada
  List<Reserva> get reservasFiltradas {
    if (horaSeleccionada == "Todos") {
      return reservas;
    }
    return reservas.where((reserva) => reserva.hora == horaSeleccionada).toList();
  }

  @override
  Widget build(BuildContext context) {
    final horas = ["Todos", "11:00 AM", "1:00 PM", "3:00 PM", "4:00 PM", "5:00 PM"];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          //! Filtro de horas
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: horas.map((hora) {
                final seleccionada = hora == horaSeleccionada;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      horaSeleccionada = hora;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: seleccionada ? Colors.green : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Text(
                      hora,
                      style: TextStyle(
                        color: seleccionada ? Colors.green : Colors.grey,
                        fontWeight: seleccionada ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          //! Lista de reservaciones
          Expanded(
            child: ListView.builder(
              itemCount: reservasFiltradas.length,
              itemBuilder: (context, index) {
                final reserva = reservasFiltradas[index];
                return ClientCardReservaciones(
                  fecha: '${reserva.fecha} - ${reserva.hora}',
                  nombreCliente: reserva.nombre,
                  horaYPersonas: '${reserva.hora}\n${reserva.cantidadPersonas} Personas',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
