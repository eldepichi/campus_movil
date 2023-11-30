class LdapUser {
  final String? nombre;
  final String? apellidos;
  final String? usuario;
  final String? mail;
  final String? mailInstitucional;
  final String? rama;
  final String? nombrePerfil;
  final String? nombrePerfilCompleto;
  final bool? password;
  final int? estatusId;
  final String? estatus;
  final int? programaAcademicoId;
  final String? usuarioPeticion;
  final String? usuarioEncriptado;
  final String? passEncriptado;

  LdapUser({
    this.nombre,
    this.apellidos,
    this.usuario,
    this.mail,
    this.mailInstitucional,
    this.rama,
    this.nombrePerfil,
    this.nombrePerfilCompleto,
    this.password,
    this.estatusId,
    this.estatus,
    this.programaAcademicoId,
    this.usuarioPeticion,
    this.usuarioEncriptado,
    this.passEncriptado,
  });

  factory LdapUser.fromJson(Map<String, dynamic> json) => LdapUser(
        nombre: json['Nombre'] ?? '',
        apellidos: json['Apellidos'] ?? '',
        usuario: json['Usuario'] ?? '',
        mail: json['Mail'] ?? '',
        mailInstitucional: json['MailInstitucional'] ?? '',
        rama: json['Rama'] ?? '',
        nombrePerfil: json['NombrePerfil'] ?? '',
        nombrePerfilCompleto: json['NombrePerfilCompleto'] ?? '',
        password: json['Password'] ?? false,
        estatusId: json['EstatusId'],
        estatus: json['Estatus'] ?? '',
        programaAcademicoId: json['ProgramaAcademicoId'],
        usuarioPeticion: json['Usuario_Peticion'] ?? '',
        usuarioEncriptado: json['UsuarioEncriptado'] ?? '',
        passEncriptado: json['PassEncriptado'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'Nombre': nombre,
        'Apellidos': apellidos,
        'Usuario': usuario,
        'Mail': mail,
        'MailInstitucional': mailInstitucional,
        'Rama': rama,
        'NombrePerfil': nombrePerfil,
        'NombrePerfilCompleto': nombrePerfilCompleto,
        'Password': password,
        'EstatusId': estatusId,
        'Estatus': estatus,
        'ProgramaAcademicoId': programaAcademicoId,
        'Usuario_Peticion': usuarioPeticion,
        'UsuarioEncriptado': usuarioEncriptado,
        'PassEncriptado': passEncriptado,
      };
}
