import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import 'app/features/authentication/domain/repositories/authentication_repository.dart';
import 'app/features/authentication/domain/repositories/connectivity_repository.dart';
import 'app/features/authentication/domain/repositories/menu_drawer_repository.dart';
import 'app/features/authentication/infrastructure/http/http.dart';
import 'app/features/authentication/infrastructure/repository_implementation/authentication_repository_impl.dart';
import 'app/features/authentication/infrastructure/repository_implementation/connectivity_repository_impl.dart';
import 'app/features/authentication/infrastructure/repository_implementation/menu_drawer_repository_impl.dart';
import 'app/features/authentication/infrastructure/service/local/session_service.dart';
import 'app/features/authentication/infrastructure/service/remote/authentication_api.dart';
import 'app/features/authentication/infrastructure/service/remote/internet_checker.dart';
import 'app/features/authentication/infrastructure/service/remote/menu_drawer_api.dart';
import 'app/features/authentication/presentation/global/controllers/menu_drawer_controller.dart';
import 'app/features/authentication/presentation/global/controllers/session_controller.dart';
import 'app/my_app.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  final http = Http(
    client: Dio(),
  );
  final menuDrawerRepository = MenuDrawerRepositoryImpl(
    MenuDrawerApi(http),
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<ConnectivityRepository>(
          create: (_) => ConnectivityRepositoryImpl(
            Connectivity(),
            InternetChecker(),
          ),
        ),
        Provider<MenuDrawerRepository>(
          create: (_) => menuDrawerRepository,
        ),
        Provider<AuthenticationRepository>(
          create: (context) => AuthenticationRepositoryImpl(
            AuthenticationAPI(http),
            SessionService(
              const FlutterSecureStorage(),
            ),
            MenuDrawerRepositoryImpl(
              MenuDrawerApi(http),
            ),
          ),
        ),
        ChangeNotifierProvider<SessionController>(
          create: (_) => SessionController(),
        ),
        ChangeNotifierProvider<MenuDrawerController>(
          create: (_) => MenuDrawerController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
