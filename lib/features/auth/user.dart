class User {
  final String name;
  final String email; // Campo para el correo electrónico
  final bool isAdmin; // Campo para indicar si el usuario es administrador

  User({
    required this.name,
    required this.email,
    required this.isAdmin,
  });
}

final currentUser = User(
  name: "Ivan Joe",
  email: "joe@gmail.com",
  isAdmin: false, // Usuario cliente
);

final adminUser = User(
  name: "Admin Usuario",
  email: "admin@gmail.com",
  isAdmin: true, // Usuario administrador
);
