import 'dart:convert';

import '../models/user/identificacion_user.dart';

IdetificacionUserMapper alumnosResponseFromJson(String str) => IdetificacionUserMapper.fromJson(json.decode(str));

String alumnosResponseToJson(IdetificacionUserMapper data) => json.encode(data.toJson());

class IdetificacionUserMapper {
  final bool? success;
  final int? registro;
  final IdentificacionUser? user;
  final int? estatus;
  final String? message;

  IdetificacionUserMapper({
    this.success,
    this.registro,
    this.user,
    this.estatus,
    this.message,
  });

  factory IdetificacionUserMapper.fromJson(Map<String, dynamic> json) => IdetificacionUserMapper(
        success: json['success'],
        registro: json['registro'],
        user: json['obj'] == null ? null : IdentificacionUser.fromJson(json['obj']),
        estatus: json['estatus'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'registro': registro,
        'obj': user?.toJson(),
        'estatus': estatus,
        'message': message,
      };
}
