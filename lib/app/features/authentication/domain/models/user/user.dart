import 'package:equatable/equatable.dart';

import '../../mappers/menu_mapper.dart';
import 'identificacion_user.dart';
import 'ldap_user.dart';

class User extends Equatable {
  const User({
    this.identificacionUser,
    this.ldapUser,
    this.menuMApper,
    this.photo,
  });

  final IdentificacionUser? identificacionUser;
  final LdapUser? ldapUser;
  final MenuMapper? menuMApper;
  final String? photo;

  @override
  List<Object?> get props => [
        identificacionUser,
        ldapUser,
        menuMApper,
        photo,
      ];
}
