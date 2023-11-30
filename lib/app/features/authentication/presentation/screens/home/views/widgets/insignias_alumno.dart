import 'package:flutter/material.dart';

import '../../../../global/widgets/divider_custom.dart';
import 'perfil_alumno.dart';

class InsigniasAlumno extends StatelessWidget {
  final String monedas;
  final int insignias;
  final String avatarImg;
  final String avatarNombre;
  final bool visible;
  const InsigniasAlumno({
    Key? key,
    required this.monedas,
    required this.insignias,
    required this.avatarImg,
    required this.avatarNombre,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double tamanios = 50.0;
    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MonedasAcumuladas(
            tamanios: tamanios,
            monedas: monedas,
          ),
          const DividerCustom(
            color: Colors.grey,
            height: 80,
            width: 1,
          ),
          _InsigniasAcumuladas(
            tamanios: tamanios,
            insignias: insignias,
          ),
          const DividerCustom(
            color: Colors.grey,
            height: 80,
            width: 1,
          ),
          _AvatarGami(
            tamanios: tamanios,
            imgUrl: avatarImg,
            nombre: avatarNombre,
          ),
        ],
      ),
    );
  }
}

class _AvatarGami extends StatelessWidget {
  final double tamanios;
  final String imgUrl;
  final String nombre;

  const _AvatarGami({
    Key? key,
    required this.tamanios,
    required this.imgUrl,
    required this.nombre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: tamanios,
            height: tamanios,
            child: LoadImageAnimated(
              urlImage: imgUrl,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            nombre,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text('Avatar'),
        ),
      ],
    );
  }
}

class _InsigniasAcumuladas extends StatelessWidget {
  final double tamanios;
  final int? insignias;

  const _InsigniasAcumuladas({
    Key? key,
    required this.tamanios,
    required this.insignias,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: tamanios,
            height: tamanios,
            child: Image.asset(
              'assets/trophy.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            '$insignias',
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text('Insignias'),
        ),
      ],
    );
  }
}

class _MonedasAcumuladas extends StatelessWidget {
  final double tamanios;
  final String monedas;

  const _MonedasAcumuladas({
    Key? key,
    required this.tamanios,
    required this.monedas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            width: tamanios,
            height: tamanios,
            child: Image.asset(
              'assets/moneda_2.png',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            monedas,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Text('Monedas'),
        ),
      ],
    );
  }
}
