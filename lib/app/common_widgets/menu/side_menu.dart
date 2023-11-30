import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../features/authentication/domain/models/menu/menu.dart';
import '../../features/authentication/domain/repositories/authentication_repository.dart';

class SideMenuAlumno extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffolKey;
  final List<MenuItem> appMenuItems;
  const SideMenuAlumno({
    Key? key,
    required this.scaffolKey,
    required this.appMenuItems,
  }) : super(key: key);

  @override
  State<SideMenuAlumno> createState() => _SideMenuAlumnoState();
}

class _SideMenuAlumnoState extends State<SideMenuAlumno> {
  int navDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final AuthenticationRepository authenticationRepository = context.read();
    final size = MediaQuery.of(context).size;
    double width = (size.width / 20);
    if (widget.appMenuItems.isEmpty) {
      return NavigationDrawer(
        children: [
          const _DrawerHeader(),
          SizedBox(
            width: size.width,
            child: Text(
              'No se cargaron las opciones correctamente',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      );
    }
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      // onDestinationSelected una función que recibe el valor de la posicion en el item actual,
      // es decir que en la opcion que se presione actualizara el valor de navDrawerIndex, y el mismo valor
      // que se recibe sirve para recorrer la lista de opciones y navegar a la vista deseada.
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        // Si la opción no es la de salir actua con normalidad, de lo contrario ejecuta el método logOut
        // para cerar la sesión de en el dispositivo.
        if (widget.appMenuItems[value].ruta != '/salir') {
          if (widget.appMenuItems[value].nombre == 'Inicio') {
            context.pushReplacement(widget.appMenuItems[value].ruta!);
          } else {
            context.push(widget.appMenuItems[value].ruta!);
          }
          // Esta línea es la enargada de cerrar el menú drawer cuando se preciona una opción valida
          widget.scaffolKey.currentState?.closeDrawer();
        } else {
          // Ejecutamos el metodo para cerrar nuestra sesión en la app
          authenticationRepository.signOut();
        }
      },
      children: [
        // Este widget coloca la iagen en el header d nuestro menu drawer
        const _DrawerHeader(),
        // Desenvolvemos la lista del menú creando una sublista iniciando en el item 0 y terminando en el tamaño de la lista restandole 1,
        // para de esta manera dejar el ultimo item sin pintar.
        ...widget.appMenuItems.sublist(0, (widget.appMenuItems.length - 1)).map(
              (item) => NavigationDrawerDestination(
                icon: SizedBox(
                  height: 35,
                  width: 35,
                  child: Image.asset('assets/ic_drawer/${item.imageIcon}'),
                ),
                label: Row(
                  children: [
                    Text(item.nombre!),
                    SizedBox(width: width),
                    item.amount! > 0
                        ? CircleNotification(amount: item.amount!)
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
        // Aqui se desenvuelve la lista pero solo en el ultimo elemento para así mostrar la opción de salir con un separador
        ...widget.appMenuItems.sublist((widget.appMenuItems.length - 1)).map(
              (item) => NavigationDrawerDestination(
                icon: SizedBox(
                  height: 35,
                  width: 35,
                  child: Image.asset('assets/ic_drawer/${item.imageIcon}'),
                ),
                label: Text(item.nombre!),
              ),
            ),
      ],
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/menu-img.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(),
    );
  }
}

class CircleNotification extends StatelessWidget {
  final int amount;
  final double? width;
  final double? height;
  final double? fontSize;
  const CircleNotification({
    Key? key,
    required this.amount,
    this.width = 17,
    this.height = 17,
    this.fontSize = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
      ),
      child: Center(
        child: Text(
          amount > 9 ? '9+' : '$amount',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}
