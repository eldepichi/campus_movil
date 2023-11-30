import 'package:flutter/material.dart';

PreferredSizeWidget appBarCustom() {
  return AppBar(
    title: const Column(
      children: [
        Text('UVEG App'),
        Text(
          'UNIVERSIDAD VIRTUAL DEL ESTADO DE GUANAJUATO',
          style: TextStyle(fontSize: 8),
        ),
      ],
    ),
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: const Icon(Icons.menu_open),
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    ),
  );
}

/*
PreferredSizeWidget appBarCustomWithoutDrawer({
  bool? showTabs = false,
  List<Unidades>? unidades,
}) {
  return showTabs!
      ? AppBar(
          elevation: 0,
          title: const Column(
            children: [
              Text('UVEG App'),
              Text(
                'UNIVERSIDAD VIRTUAL DEL ESTADO DE GUANAJUATO',
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
          bottom: TabBar(
            //labelColor: Colors.white,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _getTabs(unidades!),
          ),
        )
      : AppBar(
          elevation: 0,
          title: const Column(
            children: [
              Text('UVEG App'),
              Text(
                'UNIVERSIDAD VIRTUAL DEL ESTADO DE GUANAJUATO',
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
        );
}
*/