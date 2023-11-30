import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../common_widgets/loaders/loader_uveg/loading_uveg.dart';
import '../../../../../../common_widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../domain/models/menu/menu.dart';
import '../../../global/controllers/session_controller.dart';
import 'widgets/barra_puntaje_nivel.dart';
import 'widgets/card_alumno.dart';
import 'widgets/insignias_alumno.dart';
import 'widgets/mensajes_alumnos.dart';
import 'widgets/perfil_alumno.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Función asíncrona para realizar el refresh en el inicio de la app

  Future<void> _onRefresh() async {
    //await deleteImageFromCache(Preferences.url);
    //await initWs();
  }

  // Función asíncrona la cual se ejecuta al iniciar la aplicacion y cargar información del server
  /*
  Future<void> initWs() async {
    await InfoGamAlumno().getInfoPerfilAlumno(context, '', true);
    await CursosAlumnos.getInfoPerfilAlumno();
  }
  */

  @override
  void initState() {
    super.initState();
    //initWs();
  }

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();
    final menuMApper = sessionController.state!.menuMApper;
    List<MenuItem> optionsList = menuMApper!.menuItems!;
    return ScaffoldCustom(
      appMenuItems: optionsList,
      child: _BodyHomePage(
        onRefresh: _onRefresh,
      ),
    );
  }
}

class _BodyHomePage extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const _BodyHomePage({
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();
    final user = sessionController.state;
    final identificacionUser = user?.identificacionUser;
    final String nombreC = '${identificacionUser!.nombreCompleto}';
    final String proEstudio = '${identificacionUser.proProgramaEstudioNombre}';
    final String matricula = '${identificacionUser.aluMatricula}';

    return Stack(
      children: [
        RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView(
            shrinkWrap: true,
            children: [
              PerfilAlumno(
                photo: '${user!.photo}',
              ),
              _CardPerfilUser(
                nombreC: nombreC,
                programaEstudio: proEstudio,
                matricula: matricula,
                //infoAlumnos: infoAlumnos,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: FutureBuilder(
                  //future: CursosAlumnos.getInfoPerfilAlumno(),
                  future: Future.delayed(const Duration(milliseconds: 30000)),
                  builder: (context, snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      children = <Widget>[
                        const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Result: ${snapshot.data}'),
                        ),
                      ];
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        LoadingUveg(),
                      ];
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        /*
        const WarnigChangeNotifierWidget(
          texto: Text(
            'No tienes conexión a internet.',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        */
      ],
    );
  }
}

class _CardPerfilUser extends StatelessWidget {
  const _CardPerfilUser({
    Key? key,
    required this.nombreC,
    required this.programaEstudio,
    required this.matricula,
    //required this.infoAlumnos,
  }) : super(key: key);

  final String nombreC;
  final String programaEstudio;
  final String matricula;
  //final AdministrativosInfo infoAlumnos;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CardAlumno(
                  nombreAlumno: nombreC,
                  programa: programaEstudio,
                  matricula: matricula,
                ),
                const BarraPuntajeNivel(
                  nivel: 1,
                  imgNivel: 'https://campus.uveg.edu.mx/assets/img/escudos/lv_21.webp',
                  puntosMaximos: 100,
                  puntosObtenidos: 50,
                  avanceNivel: 50.0,
                  puntosFaltantes: 50,
                ),
                const InsigniasAlumno(
                  monedas: '10',
                  insignias: 5,
                  avatarImg: 'https://campus.uveg.edu.mx/assets/img/avatars/avatar_2.webp',
                  avatarNombre: 'Mochi',
                ),
              ],
            ),
          ),
          const MensajesAlumno(fecha: '08/12/2022'),
        ],
      ),
    );
  }
}
