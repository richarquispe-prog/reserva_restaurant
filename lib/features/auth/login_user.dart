
import 'package:reserva_restaurant/features/auth/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<void> execute(String email, String password) async {
    return repository.login(email, password);
  }
}
