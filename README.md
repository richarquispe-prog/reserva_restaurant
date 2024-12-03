# Reserva Restaurant 🍽️

## Descripción del Proyecto
Una aplicación de Flutter para reservas de restaurantes.

## Primeros Pasos 🚀

Este proyecto es un punto de partida para una aplicación de Flutter. 

### Recursos Útiles
- [Laboratorio: Escribe tu primera app de Flutter](https://docs.flutter.dev/get-started/codelab)
- [Libro de Cocina: Ejemplos útiles de Flutter](https://docs.flutter.dev/cookbook)

Para obtener ayuda para comenzar con el desarrollo de Flutter, consulta la
[documentación en línea](https://docs.flutter.dev/), que ofrece tutoriales,
ejemplos, orientación sobre desarrollo móvil y una referencia completa de la API.

## Justificación de la Gestión de Estado 🧩

### ¿Por qué Stateful Widgets?

#### Complejidad del Proyecto
- La aplicación es sencilla y no requiere una gestión global del estado entre diferentes pantallas o widgets.
- Cada pantalla puede manejar su propio estado sin complicaciones.

#### Simplicidad
- Los Stateful Widgets son nativos de Flutter y fáciles de implementar.
- Permite un desarrollo rápido sin configuraciones adicionales o dependencias externas.

#### Rendimiento
- Ideales para estados locales, reconstruyendo solo los widgets afectados por cambios.
- Mantiene un rendimiento óptimo.

#### Mantenibilidad
- El estado está encapsulado dentro de los widgets que lo gestionan.
- Hace que el código sea más legible y fácil de mantener en aplicaciones pequeñas.

#### Escalabilidad
- La arquitectura actual permite una transición fácil a soluciones de gestión de estado más avanzadas (como Provider o Riverpod) si el proyecto crece.

## Tecnologías Utilizadas 💻

- **Lenguaje:** Dart
- **Framework:** Flutter
- **Gestión de Estado:** Stateful Widgets

## Comenzando con el Desarrollo 🛠️

### Clonar el Repositorio
```bash
git clone https://github.com/usuario/flutter-registration-app.git