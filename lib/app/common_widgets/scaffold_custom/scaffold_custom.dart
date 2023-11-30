import 'package:flutter/material.dart';

import '../../features/authentication/domain/models/menu/menu.dart';
import '../../utils/app_bar_custom.dart';
import '../menu/side_menu.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget child;
  final Widget? gradiente;
  final bool? showDrawer;
  final List<MenuItem> appMenuItems;

  const ScaffoldCustom({
    Key? key,
    required this.child,
    this.gradiente,
    this.showDrawer = true,
    required this.appMenuItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffolKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffolKey,
      appBar: appBarCustom(),
      drawer: SideMenuAlumno(
        scaffolKey: scaffolKey,
        appMenuItems: appMenuItems,
      ),
      body: Stack(
        children: [
          gradiente == null ? Container() : gradiente!,
          child,
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.share),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
