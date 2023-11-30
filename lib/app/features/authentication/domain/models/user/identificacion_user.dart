class IdentificacionUser {
  final String? aluAlumnoId;
  final String? aluMatricula;
  final String? aluNombre;
  final String? aluPaterno;
  final String? aluMaterno;
  final String? paiPaisId;
  final String? estEstadoId;
  final String? munMunicipioId;
  final String? caeCaeId;
  final String? proProgramaEstudioId;
  final String? aluGeneracion;
  final String? aluTelefono;
  final String? aluCorreoElectronico;
  final String? pesProgramaEscolarId;
  final String? aluGenero;
  final String? aluCorreoOficial;
  final String? aluFechaRegistro;
  final String? aluFechaInscripcion;
  final String? aluPassword;
  final String? aluNumeroSeguroSocial;
  final String? reticulaid;
  final String? estatusgeneral;
  final String? edad;
  final String? aluTelefonoCelular;
  final String? estatusDesc;
  final String? aluFechaNacimiento;
  final String? aluCurp;
  final String? aluDomicilio;
  final String? aluColonia;
  final String? aluCp;
  final String? nacNacionalidadId;
  final String? aluRfc;
  final String? aluEstadoCivil;
  final String? clavePais;
  final String? paisResidencia;
  final String? estadoResidencia;
  final String? municipioResidencia;
  final String? paisNacimientoId;
  final String? paisNacimiento;
  final String? estadoNacimientoId;
  final String? estadoNacimiento;
  final String? nacDescripcion;
  final String? nombre;
  final String? caeDescripcion;
  final String? proProgramaEstudioNombre;
  final String? preProgramaAcademicoId;
  final String? preProgramaAcademicoNombre;
  final String? periodoSiguiente;
  final String? nombreCompleto;

  IdentificacionUser({
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
    this.periodoSiguiente,
    this.nombreCompleto,
  });

  factory IdentificacionUser.fromJson(Map<String, dynamic> json) => IdentificacionUser(
        aluAlumnoId: json['alu_AlumnoID'].toString(),
        aluMatricula: json['alu_Matricula'].toString(),
        aluNombre: json['alu_Nombre'].toString(),
        aluPaterno: json['alu_Paterno'].toString(),
        aluMaterno: json['alu_Materno'].toString(),
        paiPaisId: json['pai_PaisID'].toString(),
        estEstadoId: json['est_EstadoID'].toString(),
        munMunicipioId: json['mun_MunicipioID'].toString(),
        caeCaeId: json['cae_CaeID'].toString(),
        proProgramaEstudioId: json['pro_ProgramaEstudioID'].toString(),
        aluGeneracion: json['alu_Generacion'].toString(),
        aluTelefono: json['alu_Telefono'].toString(),
        aluCorreoElectronico: json['alu_CorreoElectronico'].toString(),
        pesProgramaEscolarId: json['pes_ProgramaEscolarID'].toString(),
        aluGenero: json['alu_Genero'].toString(),
        aluCorreoOficial: json['alu_CorreoOficial'].toString(),
        aluFechaRegistro: json['alu_FechaRegistro'].toString(),
        aluFechaInscripcion: json['alu_FechaInscripcion'].toString(),
        aluPassword: json['alu_Password'].toString(),
        aluNumeroSeguroSocial: json['alu_NumeroSeguroSocial'].toString(),
        reticulaid: json['reticulaid'].toString(),
        estatusgeneral: json['estatusgeneral'].toString(),
        edad: json['edad'].toString(),
        aluTelefonoCelular: json['alu_TelefonoCelular'].toString(),
        estatusDesc: json['Estatus_Desc'].toString(),
        aluFechaNacimiento: json['alu_FechaNacimiento'].toString(),
        aluCurp: json['alu_CURP'].toString(),
        aluDomicilio: json['alu_Domicilio'].toString(),
        aluColonia: json['alu_Colonia'].toString(),
        aluCp: json['alu_CP'].toString(),
        nacNacionalidadId: json['nac_NacionalidadID'].toString(),
        aluRfc: json['alu_RFC'].toString(),
        aluEstadoCivil: json['alu_EstadoCivil'].toString(),
        clavePais: json['clavePais'].toString(),
        paisResidencia: json['paisResidencia'].toString(),
        estadoResidencia: json['estadoResidencia'].toString(),
        municipioResidencia: json['municipioResidencia'].toString(),
        paisNacimientoId: json['paisNacimientoId'].toString(),
        paisNacimiento: json['paisNacimiento'].toString(),
        estadoNacimientoId: json['estadoNacimientoId'].toString(),
        estadoNacimiento: json['estadoNacimiento'].toString(),
        nacDescripcion: json['nac_Descripcion'].toString(),
        nombre: json['nombre'].toString(),
        caeDescripcion: json['cae_Descripcion'].toString(),
        proProgramaEstudioNombre: json['pro_ProgramaEstudioNombre'].toString(),
        preProgramaAcademicoId: json['pre_ProgramaAcademicoID'].toString(),
        preProgramaAcademicoNombre:
            json['pre_ProgramaAcademicoNombre'].toString(),
        periodoSiguiente: json['PeriodoSiguiente'].toString(),
        nombreCompleto: json['NombreCompleto'].toString(),
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
        'alu_FechaRegistro': aluFechaRegistro,
        'alu_FechaInscripcion': aluFechaInscripcion,
        'alu_Password': aluPassword,
        'alu_NumeroSeguroSocial': aluNumeroSeguroSocial,
        'reticulaid': reticulaid,
        'estatusgeneral': estatusgeneral,
        'edad': edad,
        'alu_TelefonoCelular': aluTelefonoCelular,
        'Estatus_Desc': estatusDesc,
        'alu_FechaNacimiento': aluFechaNacimiento,
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
        'PeriodoSiguiente': periodoSiguiente,
        'NombreCompleto': nombreCompleto,
      };
}
