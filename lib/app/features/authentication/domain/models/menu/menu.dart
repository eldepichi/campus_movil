// Se crea clase con los atributos necesarios para construir una opcion del menu drawer

import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final String? nombre;
  final String? ruta;
  final String? imageIcon;
  final int? amount;

  const MenuItem({
    required this.nombre,
    required this.ruta,
    required this.imageIcon,
    required this.amount,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) => MenuItem(
        ruta: json['ruta'],
        amount: json['mensaje'],
        imageIcon: json['icono'],
        nombre: json['nombre'],
      );

  Map<String, dynamic> toJson() => {
        'ruta': ruta,
        'mensaje': amount,
        'icono': imageIcon,
        'nombre': nombre,
      };

  @override
  List<Object?> get props => [
        nombre,
        ruta,
        imageIcon,
        amount,
      ];
}
