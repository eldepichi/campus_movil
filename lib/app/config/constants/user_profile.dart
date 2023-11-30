class UserProfile {
  static String? getUserProfile2(
    String perfil,
  ) {
    switch (perfil) {
      case 'Alumno':
        {
          return 'https://siiservicios.uveg.edu.mx/services/alumno/identificacion';
        }
      case 'admin':
      case 'admvos_acad':
      case 'soporte':
      case 'promotor':
      case 'asistente':
      case 'docaev':
      case 'control_escolar':
      case 'admon':
      case 'director_academico':
      case 'tutor':
      case 'observador':
      case 'externo':
      case 'academico':
      case 'admin_educo':
      case 'rh_plus':
      case 'psicopedagogia':
      case 'planeacion':
      case 'finanzas':
      case 'serviciosgenerales':
      case 'rectoria':
        {
          return 'https://siiservicios.uveg.edu.mx/services/cuentasLdap/identificacion';
        }
      case 'pav':
      case 'ptc':
        {
          return 'https://siiservicios.uveg.edu.mx/services/cuentasLdap/identificacion';
        }
      case 'EC':
      case 'AlumnoEduCo':
      case 'ec':
        {
          return 'https://siiservicios.uveg.edu.mx/services/alumnosEduco/identificacion';
        }
      default:
        {
          return null;
        }
    }
  }

  static String? getUserProfile(String perfil) {
    return {
      'Alumno': 'Alumno',
      'admin': 'admin',
      'admvos_acad': 'admvos_acad',
      'soporte': 'soporte',
      'promotor': 'promotor',
      'asistente': 'asistente',
      'docaev': 'docaev',
      'control_escolar': 'control_escolar',
      'admon': 'admon',
      'director_academico': 'director_academico',
      'tutor': 'tutor',
      'observador': 'observador',
      'externo': 'externo',
      'academico': 'academico',
      'admin_educo': 'admin_educo',
      'rh_plus': 'rh_plus',
      'psicopedagogia': 'psicopedagogia',
      'planeacion': 'planeacion',
      'finanzas': 'finanzas',
      'serviciosgenerales': 'serviciosgenerales',
      'rectoria': 'rectoria',
      'pav': 'pav',
      'ptc': 'ptc',
      'EC': 'EC',
      'AlumnoEduCo': 'AlumnoEduCo',
      'ec': 'ec',
    }[perfil];
  }
}
