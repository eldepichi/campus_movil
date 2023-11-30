
import 'package:flutter/material.dart';

class CardAlumno extends StatelessWidget {
  final String? nombreAlumno, programa, matricula;
  const CardAlumno({
    Key? key,
    this.nombreAlumno, 
    this.programa,
    this.matricula,
  }) : super(key: key);

  @override
  Widget build(context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Column(
        children: [
          Text(
            '$nombreAlumno',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            '$programa',
            style: const TextStyle(
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Matricula: $matricula',
            style: const TextStyle(
              color: Color.fromARGB(255, 10, 126, 221),
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
