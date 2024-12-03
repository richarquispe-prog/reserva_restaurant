import 'package:flutter/material.dart';
import 'package:reserva_restaurant/core/utils/mensjes_dialogo.dart';

class ClientCardReservaciones extends StatelessWidget {
  final String fecha;
  final String nombreCliente;
  final String horaYPersonas;

  const ClientCardReservaciones({
    super.key,
    required this.fecha,
    required this.nombreCliente,
    required this.horaYPersonas,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //! Fecha y hora
            Text(
              fecha,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            const SizedBox(height: 8.0),

            //! Nombre y hora derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  nombreCliente,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black45),
                ),
                Text(
                  horaYPersonas,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // !Botones de "Llegó" y "No llegó"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    //! Acción para el botón "Llegó"
                    await showConfirmationDialog(context, "Confirmación",
                        "¿Seguro que deseas confirmar esta acción?");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    'Llegó',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    //! Acción para el botón "No llegó"
                    await showConfirmationDialog(context, "Confirmación",
                        "¿Seguro que deseas confirmar esta acción?");
                  },
                  child: const Text(
                    'No Llegó',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
