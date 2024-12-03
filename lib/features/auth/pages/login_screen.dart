import 'package:flutter/material.dart';
import 'package:reserva_restaurant/features/auth/pages/registratration_screen.dart';
import 'package:reserva_restaurant/features/auth/pages/reset_password.dart';
import 'package:reserva_restaurant/features/auth/widgets/email_field.dart';
import 'package:reserva_restaurant/features/auth/widgets/login_button_google.dart';
import 'package:reserva_restaurant/features/auth/widgets/login_button.dart';
import 'package:reserva_restaurant/features/auth/widgets/paswword_field';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 55),
                SizedBox(
                  height: 200,
                  child: Image.asset(
                    'assets/images/logoreservarestaurant.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 45),
                EmailField(controller: emailController),
                const SizedBox(height: 25),
                PasswordField(controller: passwordController),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        '¿Has olvidado tu contraseña?',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                LoginButton(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                const SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      'O',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                //!boton de google
                GoogleBtn(
                  onPressed: () {},
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('¿No tiene una cuenta?'),
                    GestureDetector(
                      onTap: () {
                        //! Implementa la navegación al registro
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ));
                      },
                      child: const Text(
                        ' Regístrate',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
