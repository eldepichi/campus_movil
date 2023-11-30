import '../either.dart';
import '../models/user/auth_error.dart';
import '../models/user/user.dart';

abstract class AuthenticationRepository {
  Future<bool> get isSignedIn;
  Future<User?> getUserData();
  Future<void> signOut();
  Future<Either<AuthError,  User?>> sigIn(String userName, String password);
}
