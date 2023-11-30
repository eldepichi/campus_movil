import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../../config/routes/routes.dart';
import '../../../../domain/models/user/user.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/repositories/connectivity_repository.dart';
import '../../../../domain/repositories/menu_drawer_repository.dart';
import '../../../../infrastructure/service/local/session_service.dart';
import '../../../global/controllers/session_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  void _goTo(String routeName) {
    context.go(routeName);
  }

  Future<void> _init() async {
    final routeName = await () async {
      final SessionService sessionService = SessionService(
        const FlutterSecureStorage(),
      );
      final ConnectivityRepository connectivityRepository = context.read();
      final AuthenticationRepository authenticationRepository = context.read();
      final MenuDrawerRepository menuDrawerRepository = context.read();
      final SessionController sessionController = context.read();

      await Future.delayed(const Duration(milliseconds: 4450));
      final hasInternet = await connectivityRepository.hasInternet;

      if (!hasInternet) {
        return Routes.offline;
      }

      final isSignedIn = await authenticationRepository.isSignedIn;

      if (!isSignedIn) {
        return Routes.signIn;
      }

      final userTemp = await authenticationRepository.getUserData();
      if (userTemp != null) {
        final perfil = await sessionService.perfil;
        final photo = await sessionService.photo;
        final menuMapper = await menuDrawerRepository.getMenuOpcions(perfil!);

        final user2 = User(
          identificacionUser: userTemp.identificacionUser,
          ldapUser: userTemp.ldapUser,
          menuMApper: menuMapper,
          photo: photo,
        );

        sessionController.setUser(user2);
        return Routes.home;
      }

      return Routes.signIn;
    }();

    if (mounted) {
      _goTo(routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: size.height,
                width: size.width,
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 0,
                ),
                child: Image.asset('assets/splash_screen.gif'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
