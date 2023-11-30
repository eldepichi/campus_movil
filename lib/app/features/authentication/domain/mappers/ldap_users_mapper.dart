import 'dart:convert';

import '../models/user/ldap_user.dart';

LdapUsersMapper ldapUsersFromJson(String str) => LdapUsersMapper.fromJson(
      json.decode(str),
    );

String ldapUsersToJson(LdapUsersMapper data) => json.encode(data.toJson());

class LdapUsersMapper {
  final bool? success;
  final int? registro;
  final LdapUser? ldapUser;
  final int? estatus;
  final String? message;

  LdapUsersMapper({
    this.success,
    this.registro,
    this.ldapUser,
    this.estatus,
    this.message,
  });

  factory LdapUsersMapper.fromJson(Map<String, dynamic> json) =>
      LdapUsersMapper(
        success: json['success'],
        registro: json['registro'],
        ldapUser: json['obj'] == null ? null : LdapUser.fromJson(json['obj']),
        estatus: json['estatus'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'registro': registro,
        'obj': ldapUser?.toJson(),
        'estatus': estatus,
        'message': message,
      };
}
