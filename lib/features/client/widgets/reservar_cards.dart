import 'package:flutter/material.dart';

class ReservacionCards extends StatefulWidget {
  final void Function(String? day, String? time, int? people) onSelectionChanged;

  const ReservacionCards({super.key, required this.onSelectionChanged});

  @override
  State<ReservacionCards> createState() => _ReservacionCardsState();
}

class _ReservacionCardsState extends State<ReservacionCards> {
  String? selectedDay; // Día seleccionado
  String? selectedTime; // Hora seleccionada
  int? selectedPeople; // Número de personas seleccionadas

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Fila de tarjetas para seleccionar Día y Hora
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCard(
                context: context,
                title: "Día",
                subtitle: selectedDay ?? "Selecciona un día",
                icon: Icons.calendar_today,
                onButtonPressed: () => _selectDateAndTime(context),
              ),
              _buildCard(
                context: context,
                title: "Hora",
                subtitle: selectedTime ?? "Selecciona una hora",
                icon: Icons.access_time,
                onButtonPressed: () => _selectDateAndTime(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Tarjeta para seleccionar número de personas
          _CardWithDropdown(
            onValueChanged: (value) {
              setState(() {
                selectedPeople = value;
                // Notificar los cambios al widget padre
                widget.onSelectionChanged(selectedDay, selectedTime, selectedPeople);
              });
            },
          ),
        ],
      ),
    );
  }

  /// Método para construir una tarjeta de selección
  Widget _buildCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onButtonPressed,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Center(
              child: Icon(
                icon,
                size: 30,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: onButtonPressed,
                child: const Text("Seleccionar"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Método para seleccionar la fecha y la hora
  Future<void> _selectDateAndTime(BuildContext context) async {
    // Seleccionar Fecha
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (date != null) {
      // Seleccionar Hora (Modal Bottom Sheet)
      await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        builder: (_) => _BottomSheetButtons(
          onButtonPressed: (time) {
            setState(() {
              selectedDay = "${date.day}/${date.month}/${date.year}";
              selectedTime = time;
              // Notificar los cambios al widget padre
              widget.onSelectionChanged(selectedDay, selectedTime, selectedPeople);
            });
            Navigator.pop(context); // Cerrar el modal
          },
        ),
      );
    }
  }
}

/// Componente del Modal Bottom Sheet para seleccionar la hora
class _BottomSheetButtons extends StatelessWidget {
  final ValueChanged<String> onButtonPressed;

  const _BottomSheetButtons({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Selecciona una hora",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
            children: [
              ElevatedButton(
                onPressed: () => onButtonPressed("10:00 AM"),
                child: const Text("10:00 AM"),
              ),
              ElevatedButton(
                onPressed: () => onButtonPressed("12:00 PM"),
                child: const Text("12:00 PM"),
              ),
              ElevatedButton(
                onPressed: () => onButtonPressed("3:00 PM"),
                child: const Text("3:00 PM"),
              ),
              ElevatedButton(
                onPressed: () => onButtonPressed("6:00 PM"),
                child: const Text("6:00 PM"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Tarjeta para seleccionar el número de personas con un Dropdown
class _CardWithDropdown extends StatefulWidget {
  final ValueChanged<int> onValueChanged;

  const _CardWithDropdown({required this.onValueChanged});

  @override
  State<_CardWithDropdown> createState() => _CardWithDropdownState();
}

class _CardWithDropdownState extends State<_CardWithDropdown> {
  int selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personas",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Selecciona la cantidad",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Icon(
                Icons.people,
                size: 40,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomRight,
              child: DropdownButton<int>(
                value: selectedValue,
                items: List.generate(
                  6,
                  (index) => DropdownMenuItem(
                    value: index + 1,
                    child: Text("${index + 1} persona${index > 0 ? 's' : ''}"),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value!;
                    // Notificar los cambios al widget padre
                    widget.onValueChanged(selectedValue);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
