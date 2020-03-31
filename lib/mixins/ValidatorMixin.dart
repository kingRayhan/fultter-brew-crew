import 'package:string_validator/string_validator.dart'
    show isEmail, isAlphanumeric;

class ValidatorMixin {
  String emailValidator(String input) {
    if (input.length == 0) {
      return "Email is required";
    }
    if (!isEmail(input)) {
      return "Provide a valide email address";
    }
  }

  String passwordValidator(String input) {
    if (input.length == 0) {
      return "Password is required";
    }

    if (input.length > 0 && input.length < 6)
      return "Give at least 5 characters";

    if (!isAlphanumeric(input.trim())) {
      return "Special character is not allowed";
    }
  }
}
