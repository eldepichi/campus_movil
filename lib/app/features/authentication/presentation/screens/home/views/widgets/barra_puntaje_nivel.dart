import 'package:flutter/material.dart';

import 'perfil_alumno.dart';

class BarraPuntajeNivel extends StatelessWidget {
  final int nivel;
  final String imgNivel;
  final int puntosMaximos;
  final int puntosObtenidos;
  final bool isClickeableLabel;
  final double avanceNivel;
  final int puntosFaltantes;
  const BarraPuntajeNivel({
    Key? key,
    required this.nivel,
    required this.imgNivel,
    required this.puntosMaximos,
    required this.puntosObtenidos,
    required this.avanceNivel,
    this.isClickeableLabel = true,
    required this.puntosFaltantes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _NivelPuntosGami(
          nivel: nivel,
          imgNivel: imgNivel,
          puntosMaximos: puntosMaximos,
          puntosObtenidos: puntosObtenidos,
        ),
        _BarraNivel(
          avanceNivel: avanceNivel,
          puntosFaltantes: puntosFaltantes,
          isClickeableLabel: isClickeableLabel,
        ),
      ],
    );
  }
}

class _BarraNivel extends StatelessWidget {
  final double avanceNivel;
  final int puntosFaltantes;
  final bool? isClickeableLabel;
  const _BarraNivel({
    Key? key,
    required this.avanceNivel,
    required this.puntosFaltantes,
    this.isClickeableLabel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: (avanceNivel / 100),
            backgroundColor: Colors.grey[400],
            valueColor: const AlwaysStoppedAnimation(Colors.amber),
            minHeight: 8,
          ),
          Visibility(
            visible: isClickeableLabel!,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Te faltan $puntosFaltantes puntos para subir de nivel',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NivelPuntosGami extends StatelessWidget {
  const _NivelPuntosGami({
    Key? key,
    required this.imgNivel,
    required this.nivel,
    required this.puntosObtenidos,
    required this.puntosMaximos,
  }) : super(key: key);

  final String imgNivel;
  final int nivel;
  final int puntosObtenidos;
  final int puntosMaximos;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 30,
                width: 20,
                child: LoadImageAnimated(
                  urlImage: imgNivel,
                  borderRadius: BorderRadius.zero,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 8),
              Text('Nivel $nivel'),
            ],
          ),
          Text(
            '$puntosObtenidos/$puntosMaximos puntos',
          ),
        ],
      ),
    );
  }
}
