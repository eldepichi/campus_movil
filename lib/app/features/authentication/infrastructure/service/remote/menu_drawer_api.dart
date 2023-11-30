import 'dart:convert';

import '../../../../../config/constants/environment.dart';
import '../../../domain/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/mappers/menu_mapper.dart';
import '../../../domain/models/user/auth_error.dart';
import '../../http/http.dart';

class MenuDrawerApi {
  const MenuDrawerApi(this._http);
  final Http _http;

  Future<Either<AuthError, MenuMapper?>> menuOpcions(
    String perfil,
  ) async {
    final result = await _http.request(
      'https://siiservicios.uveg.edu.mx/campus/menu/perfil',
      method: HttpMethod.post,
      data: {
        'perfil': perfil,
        'tipo': 2,
      },
      headers: {
        'Content-Type': 'application/json',
        'apiKey': Environment.apiKey1,
      },
    );

    return result.when(
      (authError) => Either.left(authError),
      (responseMenu) {
        Map<String, dynamic> data = jsonDecode(responseMenu);
        bool estatus = data['success'];
        if (estatus) {
          return Either.right(
            menuMapperFromJson(responseMenu),
          );
        }
        return Either.left(
          AuthError(
            titulo: 'Error',
            message: 'Probelmas con la petición al servidor',
            error: SignInFailure.notFound,
          ),
        );
      },
    );
  }
}
