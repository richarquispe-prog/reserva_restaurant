
import 'package:reserva_restaurant/core/utils/formateador_fecha.dart'; 

class Reserva {
  final String nombre; // Nombre de la persona que reserva
  final String fecha; 
  final int cantidadPersonas; // Cantidad de personas que reservaron 
  final String hora; // Hora de la reserva (de la lista proporcionada)
  final bool llego; // Indica si la persona llegó o no

  Reserva({
    required this.nombre,
    required this.fecha,
    required this.cantidadPersonas,
    required this.hora,
    required this.llego,
  });
}

//! Metodo para generar 10 reservas aleatorias con fechas dinamicas
List<Reserva> generarReservas() {
  final horas = ["Todos", "11:00 AM", "1:00 PM", "3:00 PM", "4:00 PM", "5:00 PM"];
  
  //! Generar las fechas a partir de hoy
  DateTime hoy = DateTime.now();
  List<String> fechas = List.generate(10, (index) {
    DateTime fecha = hoy.add(Duration(days: index));
    return formatDate(fecha); //! Formateando la fecha 
  });

  return [
    Reserva(nombre: "Pedro Pérez", fecha: fechas[0], cantidadPersonas: 2, hora: horas[1], llego: true),
    Reserva(nombre: "Luisa Martínez", fecha: fechas[1], cantidadPersonas: 4, hora: horas[2], llego: false),
    Reserva(nombre: "Carlos López", fecha: fechas[2], cantidadPersonas: 6, hora: horas[3], llego: true),
    Reserva(nombre: "Ana Gómez", fecha: fechas[3], cantidadPersonas: 3, hora: horas[4], llego: true),
    Reserva(nombre: "Raúl Fernández", fecha: fechas[4], cantidadPersonas: 8, hora: horas[5], llego: false),
    Reserva(nombre: "Marta Ruiz", fecha: fechas[5], cantidadPersonas: 5, hora: horas[1], llego: true),
    Reserva(nombre: "José Silva", fecha: fechas[6], cantidadPersonas: 2, hora: horas[2], llego: false),
    Reserva(nombre: "Clara Núñez", fecha: fechas[7], cantidadPersonas: 7, hora: horas[3], llego: true),
    Reserva(nombre: "Elena Morales", fecha: fechas[8], cantidadPersonas: 4, hora: horas[4], llego: false),
    Reserva(nombre: "Daniel Rojas", fecha: fechas[9], cantidadPersonas: 3, hora: horas[5], llego: true),
  ];
}
