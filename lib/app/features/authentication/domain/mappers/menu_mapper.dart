import 'dart:convert';

import '../models/menu/menu.dart';

MenuMapper menuMapperFromJson(String str) => MenuMapper.fromJson(
      json.decode(str),
    );

String menuMapperToJson(MenuMapper data) => json.encode(data.toJson());

class MenuMapper {
  final bool? success;
  final int? registro;
  final List<MenuItem>? menuItems;
  final int? estatus;
  final String? message;

  MenuMapper({
    this.success,
    this.registro,
    this.menuItems,
    this.estatus,
    this.message,
  });

  factory MenuMapper.fromJson(Map<String, dynamic> json) => MenuMapper(
        success: json['success'],
        registro: json['registro'],
        menuItems: json['obj'] == null
            ? []
            : List<MenuItem>.from(
                json['obj']!.map(
                  (x) => MenuItem.fromJson(x),
                ),
              ),
        estatus: json['estatus'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'registro': registro,
        'obj': menuItems == null
            ? []
            : List<dynamic>.from(
                menuItems!.map(
                  (x) => x.toJson(),
                ),
              ),
        'estatus': estatus,
        'message': message,
      };
}
