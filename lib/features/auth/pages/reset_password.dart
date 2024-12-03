import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {

  final _emailController = TextEditingController();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restablecer contraseña',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: ()  {
                final email = _emailController.text;

                try {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Se ha enviado un correo electrónico con instrucciones para restablecer la contraseña.',
                       
                      ),
                      
                    ),
                    
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
              child: const Text('Restablecer contraseña'),
            ),
          ],
        ),
      ),
    );
  }
}
