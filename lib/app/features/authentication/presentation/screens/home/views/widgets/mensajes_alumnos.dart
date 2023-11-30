import 'package:flutter/material.dart';

import '../../../../../../../common_widgets/menu/side_menu.dart';

class MensajesAlumno extends StatelessWidget {
  static String url = '';
  static int numMensajes = -1;
  final String fecha;
  const MensajesAlumno({
    Key? key,
    required this.fecha,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Fecha limite de entrega de actividdes: $fecha',
            style: const TextStyle(color: Colors.red),
          ),
          const Stack(
            children: [
              SizedBox(
                height: 35,
                width: 35,
                child: Icon(Icons.email),
                /*
                IconButton(
                  icon: const Icon(Icons.email),
                  onPressed: () => print('Colocar webview'),
                ),
                */
              ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: CircleNotification(
                  amount: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
