import '../../../../domain/either.dart';
import '../../../../domain/models/user/auth_error.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../global/state_notifier.dart';
import 'sign_in_state.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(
    super.state, {
    required this.authenticationRepository,
  });

  final AuthenticationRepository authenticationRepository;

  void onUserChanged(String text) {
    onlyUpdate(
      state.copyWith(
        username: text.trim().toLowerCase(),
      ),
    );
  }

  void onPasswordChanged(String text) {
    onlyUpdate(
      state.copyWith(
        password: text.replaceAll(' ', ''),
      ),
    );
  }

  Future<Either<AuthError, User?>> submit() async {
    state = state.copyWith(fetching: true);
    final result = await authenticationRepository.sigIn(
      state.username,
      state.password,
    );

    result.when(
      (_) => state = state.copyWith(fetching: false),
      (_) => null,
    );

    return result;
  }
}
