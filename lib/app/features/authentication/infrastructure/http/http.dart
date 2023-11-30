import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../domain/either.dart';
import '../../domain/enums.dart';
import '../../domain/models/user/auth_error.dart';

part 'failure.dart';

enum HttpMethod { get, post }

class Http {
  Http({
    required Dio client,
  }) : _client = client;

  final Dio _client;

  Future<Either<AuthError, String>> request(
    String path, {
    //required R Function(String responseBody) onSuccess,
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> data = const {},
    bool useApiKey = true,
  }) async {
    try {
      headers = {
        'Content-Type': 'application/json',
        ...headers,
      };

      late final Response response;
      final dataString = jsonEncode(data);

      switch (method) {
        case HttpMethod.get:
          response = await _client.get(path);
        case HttpMethod.post:
          response = await _client.post(
            path,
            options: Options(
              headers: headers,
            ),
            data: dataString,
          );
      }

      //final statusCode = respose.statusCode;

      if (response.statusCode == HttpStatus.ok) {
        final responseData = json.encode(response.data);
        return Either.right(
          responseData,
        );
      }

      return Either.left(
        AuthError(
          titulo: 'Error',
          message: 'Te sere sincero Baki',
          error: SignInFailure.network,
        ),
      );
    } catch (e) {
      if (e is SocketException) {
        return Either.left(
          AuthError(
            titulo: 'Sin conexión a internet',
            message: 'Por favor verifique su conexión a internet',
            error: SignInFailure.network,
          ),
        );
      }

      return Either.left(
        AuthError(
          titulo: 'Error',
          message: '$e',
          error: SignInFailure.network,
        ),
      );
    }
  }
}
