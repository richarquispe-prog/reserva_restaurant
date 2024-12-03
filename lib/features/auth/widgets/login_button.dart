import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/admin/pages/home_page_admin.dart';
import 'package:reserva_restaurant/features/auth/user.dart';
import 'package:reserva_restaurant/features/client/pages/home_client.dart';

// Lista global de usuarios
final List<User> users = [
  currentUser,
  adminUser,
];

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.green,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            // Busca el usuario en la lista global
            final user = _findUserByEmail(emailController.text);

            if (user != null) {
              //!enviar a lapagina de administrador
              if (user.isAdmin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageAdmin()),
                );
              } else {
                //!Envar a la pagina de cliente 
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageClient()),
                );
              }
            } else {
              //! Mostrar un mensaje si el usuario no existe
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Usuario no encontrado")),
              );
            }
          } 
        },
        child: const Text(
          "Continuar",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //! Método para buscar un usuario por correo electrónico
  User? _findUserByEmail(String email) {
    try {
      return users.firstWhere((user) => user.email == email);
    } catch (e) {
      return null;
    }
  }
}
