class Validators {
  static String? validateEmail(String? value) {
    if (value!.isEmpty) return "Por favor, introduce un correo electrónico";
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[a-z]").hasMatch(value)) {
      return "Por favor, introduce un correo electrónico válido";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value!.isEmpty) return "Por favor, introduce una contraseña";
    if (value.length < 6) {
      return "Introduce una contraseña válida (Min. 6 caracteres)";
    }
    return null;
  }
}
