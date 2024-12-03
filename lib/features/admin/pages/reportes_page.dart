import 'package:flutter/material.dart';
import 'package:reserva_restaurant/core/utils/formateador_fecha.dart';
import 'package:reserva_restaurant/features/reservacion/data/reservacion.dart';

class VerReportes extends StatefulWidget {
  const VerReportes({super.key});

  @override
  State<VerReportes> createState() => _VerReportesState();
}

class _VerReportesState extends State<VerReportes> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  //! Método para seleccionar una fecha
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = formatDate(_selectedDate!); //! Formatear la fecha
      });
    }
  }

  //! Método para filtrar reservaciones por la fecha seleccionada
  List<Reserva> _filtrarReservasPorFecha(List<Reserva> reservas) {
    if (_selectedDate == null) return [];
    final String fechaSeleccionada = formatDate(_selectedDate!);
    return reservas.where((reserva) => reserva.fecha == fechaSeleccionada).toList();
  }

  @override
  Widget build(BuildContext context) {
    final reservas = generarReservas();
    final reservasFiltradas = _filtrarReservasPorFecha(reservas);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Input para seleccionar la fecha
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Seleccionar Fecha',
                hintText: 'Fecha de reporte',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              readOnly: true,
            ),
            const SizedBox(height: 16.0),

            //! Mostrar resultado basado en la fecha seleccionada
            if (reservasFiltradas.isEmpty)
              //! Mostrar mensaje si no hay reservaciones para la fecha
              const Center(
                child: Text(
                  'No hay reservaciones para esta fecha.',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! Total de reservaciones para la fecha seleccionada
                  ListTile(
                    title: const Text(
                      'Total de reservaciones para esta fecha',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('${reservasFiltradas.length} reservaciones'),
                  ),
                  const SizedBox(height: 16.0),

                  //! Listar reservaciones
                  ...reservasFiltradas.map((reserva) {
                    return ListTile(
                      title: Text(
                        reserva.nombre,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${reserva.cantidadPersonas} personas a las ${reserva.hora}',
                      ),
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
