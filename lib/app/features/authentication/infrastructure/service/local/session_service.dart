import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _keyMatricula = 'matricula';
const _keyPerfil = 'perfil';
const _keyPhoto = 'photo';

class SessionService {
  final FlutterSecureStorage _secureStorage;

  SessionService(this._secureStorage);

  Future<String?> get matricula async {
    return await _secureStorage.read(key: _keyMatricula);
  }

  Future<String?> get perfil async {
    return await _secureStorage.read(key: _keyPerfil);
  }

  Future<String?> get photo async {
    return await _secureStorage.read(key: _keyPhoto);
  }

  Future<void> saveMatricula(String matricula) {
    return _secureStorage.write(key: _keyMatricula, value: matricula);
  }

  Future<void> savePerfil(String perfil) {
    return _secureStorage.write(key: _keyPerfil, value: perfil);
  }

  Future<void> savePhoto(String photo) {
    return _secureStorage.write(key: _keyPhoto, value: photo);
  }

  Future<void> signOut() {
    return _secureStorage.deleteAll();
  }
}
