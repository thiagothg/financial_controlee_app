import '../interface/error_interceptor_interface.dart';

class RegisterErrorInterceptor implements IErrorInterceptor {
  @override
  String handleError(String error) {
    switch (error) {
      case 'ERROR_WEAK_PASSWORD':
        return 'Acho que essa senha está muito curta, tente uma maior!';
      case 'ERROR_INVALID_EMAIL':
        return 'Ops! Esse email é inválido!';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Esse email já está cadastrado,'
            'se já tem uma conta basta fazer o login!';
      default:
        return 'Não foi possível realizar o registro,'
            'tente novamente mais tarde.';
    }
  }

  @override
  String handleAuthError(String error) {
    print(error);
    switch (error) {
      case "invalid-email":
        return "Your email address appears to be malformed.";
      case "wrong-password":
        return "Your password is wrong.";
      case "user-not-found":
        return "User with this email doesn't exist.";
      case "user-disabled":
        return "User with this email has been disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
        return "Too many requests. Try again later.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Signing in with Email and Password is not enabled.";
      default:
        return "An undefined Error happened.";
    }
  }
}