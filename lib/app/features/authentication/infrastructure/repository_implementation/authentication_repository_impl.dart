import 'dart:convert';

import '../../../../config/constants/environment.dart';
import '../../../../config/constants/user_profile.dart';
import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/mappers/identificacion_user_mapper.dart';
import '../../domain/mappers/ldap_users_mapper.dart';
import '../../domain/models/user/auth_error.dart';
import '../../domain/models/user/ldap_user.dart';
import '../../domain/models/user/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/menu_drawer_repository.dart';
import '../service/local/session_service.dart';
import '../service/remote/authentication_api.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl(
    this._authenticationAPI,
    this._sessionService,
    this._menuDrawerRepository,
  );

  final AuthenticationAPI _authenticationAPI;
  final SessionService _sessionService;
  final MenuDrawerRepository _menuDrawerRepository;

  @override
  Future<User?> getUserData() async {
    final matricula = await _sessionService.matricula;
    final perfil = await _sessionService.perfil;
    final urlIdent = UserProfile.getUserProfile2(perfil!);
    if (urlIdent != null) {
      final path = urlIdent;
      final idenUser = await _authenticationAPI.identificacionUser(
        path: path,
        apiKey: Environment.apiKey2,
        body: {
          'data': matricula,
        },
      );

      return idenUser.when(
        (failure) async => const User(),
        (userResponse) async {
          final identUser = alumnosResponseFromJson(userResponse).user!;
          final menuMApper = await _menuDrawerRepository.getMenuOpcions(perfil);
          return User(
            identificacionUser: identUser,
            ldapUser: LdapUser(),
            menuMApper: menuMApper,
          );
        },
      );
    } else {
      return const User();
    }
  }

  @override
  Future<bool> get isSignedIn async {
    return await _sessionService.matricula != null;
  }

  @override
  Future<Either<AuthError, User?>> sigIn(
    String userName,
    String password,
  ) async {
    final requestLdapUsers = await _authenticationAPI.getLdapUsers(
      userName,
      password,
    );

    return requestLdapUsers.when(
      (failure) async => Either.left(failure),
      (responseLdapUsers) async => _handleLdapUsers(responseLdapUsers),
    );
  }

  Future<Either<AuthError, User?>> _handleLdapUsers(
    String responseLdapUsers,
  ) async {
    Map data = jsonDecode(responseLdapUsers);
    bool estatus = data['success'];

    if (estatus) {
      final String perfil = data['obj']['NombrePerfil'];
      final String usuario = data['obj']['Usuario'];
      final String usuarioEstatus = data['obj']['Estatus'] ?? '';
      //final String usuarioEncr = data['obj']['UsuarioEncriptado'];
      //final String perfilCompleto = data['obj']['NombrePerfilCompleto'];
      //final String rama = data['obj']['Rama'];
      //final int estatusId = data['obj']['EstatusId'] ?? 0;

      if (usuarioEstatus == 'Inactivo') {
        return Either.left(
          AuthError(
            titulo: 'Acceso denegado',
            message: 'Usuarios sabes sin acceso',
            error: SignInFailure.unauthorized,
          ),
        );
      } else {
        final urlIdent = UserProfile.getUserProfile2(perfil);
        if (urlIdent != null) {
          final path = urlIdent;
          final idenUser = await _authenticationAPI.identificacionUser(
            path: path,
            apiKey: Environment.apiKey2,
            body: {
              'data': usuario,
            },
          );

          return idenUser.when(
            (failure) async => Either.left(failure),
            (userResponse) async {
              final photo = await _authenticationAPI.getPhoto(usuario);
              final identUser = alumnosResponseFromJson(userResponse).user!;
              final ldapUser = ldapUsersFromJson(responseLdapUsers).ldapUser;
              final menuDrawer = await _menuDrawerRepository.getMenuOpcions(
                perfil,
              );
              _sessionService.saveMatricula(usuario);
              _sessionService.savePerfil(perfil);
              _sessionService.savePhoto(photo!);
              return Either.right(
                User(
                  identificacionUser: identUser,
                  ldapUser: ldapUser,
                  menuMApper: menuDrawer,
                  photo: photo,
                ),
              );
            },
          );
        } else {
          return Either.left(
            AuthError(
              titulo: 'Acceso denegado',
              message: 'Usuario sin permisos de acceso',
              error: SignInFailure.unauthorized,
            ),
          );
        }
      }
    }
    final String message = data['message'];

    return Either.left(
      AuthError(
        titulo: 'Acceso denegado',
        message: message,
        error: SignInFailure.unauthorized,
      ),
    );
  }

  @override
  Future<void> signOut() async {
    return await _sessionService.signOut();
  }
}
