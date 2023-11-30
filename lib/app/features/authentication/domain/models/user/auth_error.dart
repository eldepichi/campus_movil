import '../../enums.dart';

class AuthError {
  final String titulo;
  final String message;
  final SignInFailure error;

  AuthError({
    required this.titulo,
    required this.message,
    required this.error,
  });
}
