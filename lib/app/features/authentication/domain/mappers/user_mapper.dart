import 'dart:convert';

MenuMapper menuMapperFromJson(String str) => MenuMapper.fromJson(json.decode(str));

String menuMapperToJson(MenuMapper data) => json.encode(data.toJson());

class MenuMapper {
    final LdapUser? ldapUser;
    final IdentificacionUser? identificacionUser;

    MenuMapper({
        this.ldapUser,
        this.identificacionUser,
    });

    factory MenuMapper.fromJson(Map<String, dynamic> json) => MenuMapper(
        ldapUser: json['ldapUser'] == null ? null : LdapUser.fromJson(json['ldapUser']),
        identificacionUser: json['identificacionUser'] == null ? null : IdentificacionUser.fromJson(json['identificacionUser']),
    );

    Map<String, dynamic> toJson() => {
        'ldapUser': ldapUser?.toJson(),
        'identificacionUser': identificacionUser?.toJson(),
    };
}

class IdentificacionUser {
    final bool? success;
    final int? registro;
    final IdentificacionUserObj? obj;
    final int? estatus;
    final String? message;

    IdentificacionUser({
        this.success,
        this.registro,
        this.obj,
        this.estatus,
        this.message,
    });

    factory IdentificacionUser.fromJson(Map<String, dynamic> json) => IdentificacionUser(
        success: json['success'],
        registro: json['registro'],
        obj: json['obj'] == null ? null : IdentificacionUserObj.fromJson(json['obj']),
        estatus: json['estatus'],
        message: json['message'],
    );

    Map<String, dynamic> toJson() => {
        'success': success,
        'registro': registro,
        'obj': obj?.toJson(),
        'estatus': estatus,
        'message': message,
    };
}

class IdentificacionUserObj {
    final int? aluAlumnoId;
    final String? aluMatricula;
    final String? aluNombre;
    final String? aluPaterno;
    final String? aluMaterno;
    final int? paiPaisId;
    final int? estEstadoId;
    final int? munMunicipioId;
    final int? caeCaeId;
    final int? proProgramaEstudioId;
    final int? aluGeneracion;
    final String? aluTelefono;
    final String? aluCorreoElectronico;
    final int? pesProgramaEscolarId;
    final String? aluGenero;
    final String? aluCorreoOficial;
    final DateTime? aluFechaRegistro;
    final DateTime? aluFechaInscripcion;
    final String? aluPassword;
    final String? aluNumeroSeguroSocial;
    final int? reticulaid;
    final int? estatusgeneral;
    final int? edad;
    final String? aluTelefonoCelular;
    final String? estatusDesc;
    final DateTime? aluFechaNacimiento;
    final String? aluCurp;
    final String? aluDomicilio;
    final String? aluColonia;
    final String? aluCp;
    final int? nacNacionalidadId;
    final String? aluRfc;
    final String? aluEstadoCivil;
    final String? clavePais;
    final String? paisResidencia;
    final String? estadoResidencia;
    final String? municipioResidencia;
    final int? paisNacimientoId;
    final String? paisNacimiento;
    final int? estadoNacimientoId;
    final String? estadoNacimiento;
    final String? nacDescripcion;
    final String? nombre;
    final String? caeDescripcion;
    final String? proProgramaEstudioNombre;
    final int? preProgramaAcademicoId;
    final String? preProgramaAcademicoNombre;
    final String? ultimoPeriodoInscrito;
    final String? periodoSiguiente;
    final String? nombreCompleto;

    IdentificacionUserObj({
        this.aluAlumnoId,
        this.aluMatricula,
        this.aluNombre,
        this.aluPaterno,
        this.aluMaterno,
        this.paiPaisId,
        this.estEstadoId,
        this.munMunicipioId,
        this.caeCaeId,
        this.proProgramaEstudioId,
        this.aluGeneracion,
        this.aluTelefono,
        this.aluCorreoElectronico,
        this.pesProgramaEscolarId,
        this.aluGenero,
        this.aluCorreoOficial,
        this.aluFechaRegistro,
        this.aluFechaInscripcion,
        this.aluPassword,
        this.aluNumeroSeguroSocial,
        this.reticulaid,
        this.estatusgeneral,
        this.edad,
        this.aluTelefonoCelular,
        this.estatusDesc,
        this.aluFechaNacimiento,
        this.aluCurp,
        this.aluDomicilio,
        this.aluColonia,
        this.aluCp,
        this.nacNacionalidadId,
        this.aluRfc,
        this.aluEstadoCivil,
        this.clavePais,
        this.paisResidencia,
        this.estadoResidencia,
        this.municipioResidencia,
        this.paisNacimientoId,
        this.paisNacimiento,
        this.estadoNacimientoId,
        this.estadoNacimiento,
        this.nacDescripcion,
        this.nombre,
        this.caeDescripcion,
        this.proProgramaEstudioNombre,
        this.preProgramaAcademicoId,
        this.preProgramaAcademicoNombre,
        this.ultimoPeriodoInscrito,
        this.periodoSiguiente,
        this.nombreCompleto,
    });

    factory IdentificacionUserObj.fromJson(Map<String, dynamic> json) => IdentificacionUserObj(
        aluAlumnoId: json['alu_AlumnoID'],
        aluMatricula: json['alu_Matricula'],
        aluNombre: json['alu_Nombre'],
        aluPaterno: json['alu_Paterno'],
        aluMaterno: json['alu_Materno'],
        paiPaisId: json['pai_PaisID'],
        estEstadoId: json['est_EstadoID'],
        munMunicipioId: json['mun_MunicipioID'],
        caeCaeId: json['cae_CaeID'],
        proProgramaEstudioId: json['pro_ProgramaEstudioID'],
        aluGeneracion: json['alu_Generacion'],
        aluTelefono: json['alu_Telefono'],
        aluCorreoElectronico: json['alu_CorreoElectronico'],
        pesProgramaEscolarId: json['pes_ProgramaEscolarID'],
        aluGenero: json['alu_Genero'],
        aluCorreoOficial: json['alu_CorreoOficial'],
        aluFechaRegistro: json['alu_FechaRegistro'] == null ? null : DateTime.parse(json['alu_FechaRegistro']),
        aluFechaInscripcion: json['alu_FechaInscripcion'] == null ? null : DateTime.parse(json['alu_FechaInscripcion']),
        aluPassword: json['alu_Password'],
        aluNumeroSeguroSocial: json['alu_NumeroSeguroSocial'],
        reticulaid: json['reticulaid'],
        estatusgeneral: json['estatusgeneral'],
        edad: json['edad'],
        aluTelefonoCelular: json['alu_TelefonoCelular'],
        estatusDesc: json['Estatus_Desc'],
        aluFechaNacimiento: json['alu_FechaNacimiento'] == null ? null : DateTime.parse(json['alu_FechaNacimiento']),
        aluCurp: json['alu_CURP'],
        aluDomicilio: json['alu_Domicilio'],
        aluColonia: json['alu_Colonia'],
        aluCp: json['alu_CP'],
        nacNacionalidadId: json['nac_NacionalidadID'],
        aluRfc: json['alu_RFC'],
        aluEstadoCivil: json['alu_EstadoCivil'],
        clavePais: json['clavePais'],
        paisResidencia: json['paisResidencia'],
        estadoResidencia: json['estadoResidencia'],
        municipioResidencia: json['municipioResidencia'],
        paisNacimientoId: json['paisNacimientoId'],
        paisNacimiento: json['paisNacimiento'],
        estadoNacimientoId: json['estadoNacimientoId'],
        estadoNacimiento: json['estadoNacimiento'],
        nacDescripcion: json['nac_Descripcion'],
        nombre: json['nombre'],
        caeDescripcion: json['cae_Descripcion'],
        proProgramaEstudioNombre: json['pro_ProgramaEstudioNombre'],
        preProgramaAcademicoId: json['pre_ProgramaAcademicoID'],
        preProgramaAcademicoNombre: json['pre_ProgramaAcademicoNombre'],
        ultimoPeriodoInscrito: json['UltimoPeriodoInscrito'],
        periodoSiguiente: json['PeriodoSiguiente'],
        nombreCompleto: json['NombreCompleto'],
    );

    Map<String, dynamic> toJson() => {
        'alu_AlumnoID': aluAlumnoId,
        'alu_Matricula': aluMatricula,
        'alu_Nombre': aluNombre,
        'alu_Paterno': aluPaterno,
        'alu_Materno': aluMaterno,
        'pai_PaisID': paiPaisId,
        'est_EstadoID': estEstadoId,
        'mun_MunicipioID': munMunicipioId,
        'cae_CaeID': caeCaeId,
        'pro_ProgramaEstudioID': proProgramaEstudioId,
        'alu_Generacion': aluGeneracion,
        'alu_Telefono': aluTelefono,
        'alu_CorreoElectronico': aluCorreoElectronico,
        'pes_ProgramaEscolarID': pesProgramaEscolarId,
        'alu_Genero': aluGenero,
        'alu_CorreoOficial': aluCorreoOficial,
        'alu_FechaRegistro': aluFechaRegistro?.toIso8601String(),
        'alu_FechaInscripcion': aluFechaInscripcion?.toIso8601String(),
        'alu_Password': aluPassword,
        'alu_NumeroSeguroSocial': aluNumeroSeguroSocial,
        'reticulaid': reticulaid,
        'estatusgeneral': estatusgeneral,
        'edad': edad,
        'alu_TelefonoCelular': aluTelefonoCelular,
        'Estatus_Desc': estatusDesc,
        'alu_FechaNacimiento': "${aluFechaNacimiento!.year.toString().padLeft(4, '0')}-${aluFechaNacimiento!.month.toString().padLeft(2, '0')}-${aluFechaNacimiento!.day.toString().padLeft(2, '0')}",
        'alu_CURP': aluCurp,
        'alu_Domicilio': aluDomicilio,
        'alu_Colonia': aluColonia,
        'alu_CP': aluCp,
        'nac_NacionalidadID': nacNacionalidadId,
        'alu_RFC': aluRfc,
        'alu_EstadoCivil': aluEstadoCivil,
        'clavePais': clavePais,
        'paisResidencia': paisResidencia,
        'estadoResidencia': estadoResidencia,
        'municipioResidencia': municipioResidencia,
        'paisNacimientoId': paisNacimientoId,
        'paisNacimiento': paisNacimiento,
        'estadoNacimientoId': estadoNacimientoId,
        'estadoNacimiento': estadoNacimiento,
        'nac_Descripcion': nacDescripcion,
        'nombre': nombre,
        'cae_Descripcion': caeDescripcion,
        'pro_ProgramaEstudioNombre': proProgramaEstudioNombre,
        'pre_ProgramaAcademicoID': preProgramaAcademicoId,
        'pre_ProgramaAcademicoNombre': preProgramaAcademicoNombre,
        'UltimoPeriodoInscrito': ultimoPeriodoInscrito,
        'PeriodoSiguiente': periodoSiguiente,
        'NombreCompleto': nombreCompleto,
    };
}

class LdapUser {
    final bool? success;
    final int? registro;
    final LdapUserObj? obj;
    final int? estatus;
    final String? message;

    LdapUser({
        this.success,
        this.registro,
        this.obj,
        this.estatus,
        this.message,
    });

    factory LdapUser.fromJson(Map<String, dynamic> json) => LdapUser(
        success: json['success'],
        registro: json['registro'],
        obj: json['obj'] == null ? null : LdapUserObj.fromJson(json['obj']),
        estatus: json['estatus'],
        message: json['message'],
    );

    Map<String, dynamic> toJson() => {
        'success': success,
        'registro': registro,
        'obj': obj?.toJson(),
        'estatus': estatus,
        'message': message,
    };
}

class LdapUserObj {
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

    LdapUserObj({
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

    factory LdapUserObj.fromJson(Map<String, dynamic> json) => LdapUserObj(
        nombre: json['Nombre'],
        apellidos: json['Apellidos'],
        usuario: json['Usuario'],
        mail: json['Mail'],
        mailInstitucional: json['MailInstitucional'],
        rama: json['Rama'],
        nombrePerfil: json['NombrePerfil'],
        nombrePerfilCompleto: json['NombrePerfilCompleto'],
        password: json['Password'],
        estatusId: json['EstatusId'],
        estatus: json['Estatus'],
        programaAcademicoId: json['ProgramaAcademicoId'],
        usuarioPeticion: json['Usuario_Peticion'],
        usuarioEncriptado: json['UsuarioEncriptado'],
        passEncriptado: json['PassEncriptado'],
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
