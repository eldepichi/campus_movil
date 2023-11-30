import 'dart:convert';

import '../../../../../config/constants/environment.dart';
import '../../../domain/either.dart';
import '../../../domain/models/user/auth_error.dart';
import '../../http/http.dart';

class AuthenticationAPI {
  AuthenticationAPI(this._http);

  final Http _http;

  Future<Either<AuthError, String>> getLdapUsers(
    String userName,
    String password,
  ) async {
    final result = await _http.request(
      'https://siiservicios.uveg.edu.mx/services/v1/ldapusers',
      method: HttpMethod.post,
      data: {
        'Usuario': userName,
        'Password': password,
      },
      headers: {
        'apiKey': Environment.apiKey1,
      },
      //onSuccess: (responseBody) => responseBody,
    );

    return result.when(
      (failure) => Either.left(failure),
      (responseLdapUsers) {
        return Either.right(responseLdapUsers);
      },
    );
  }

  Future<Either<AuthError, String>> identificacionUser({
    required String path,
    required String apiKey,
    required Map<String, dynamic> body,
  }) async {
    final result = await _http.request(
      path,
      method: HttpMethod.post,
      data: body,
      headers: {
        'apiKey': apiKey,
      },
      //onSuccess: (responseBody) => responseBody,
    );

    return result.when(
      (failure) => Either.left(failure),
      (newRequestToken) => Either.right(newRequestToken),
    );
  }

  Future<String?> getPhoto(
    String username,
  ) async {
    final result = await _http.request(
      'https://siiservicios.uveg.edu.mx/services/fotousuario',
      method: HttpMethod.post,
      data: {
        'usuario': username,
      },
    );

    return result.when(
      (failure) => null,
      (responsePhoto) {
        Map data = jsonDecode(responsePhoto);
        final String urlPhoto = data['obj']['url'];
        return urlPhoto;
      },
    );
  }
}
