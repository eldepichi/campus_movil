import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../service/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectibity;
  final InternetChecker _internetChecker;

  ConnectivityRepositoryImpl(this._connectibity, this._internetChecker);
  @override
  Future<bool> get hasInternet async {
    final result = await _connectibity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }
    return _internetChecker.hasInternet();
  }
}
