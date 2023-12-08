export interface Ingreso {
  id: number;
  contrasena: string;
  boleta: number;
  id_alumnos: number;
  DatosAcademicos: {
      id_alumno?: number;
      nombre: string;
      plantel: string;
      curp: number;
      rfc: number;
      cartilla: number;
      pasaporte: number;
      sexo: string;
      fecha_nacimiento: string;
      nacionalidad: string;
      entidad_nacimiento: string;
      id_direccion: number;
      id_escolaridad: number;
      id_tutor: number;
      id_dato_medico: number;
      id_tramites: number;
      id_dato_academico: number;
      email: string;
      id_estado_general: number;
      datosmedico: {
        id: number;
        peso: number;
        estatura: number;
        tipoSangre: string;
        institucion: string;
        noSeguroSocial: number;
        fechaAlta: string;
        fechaBaja: string;
        padeceEnfermedades: string;
        problemasFisicos: string;
        tatuado: string;
        piePlano: string;
        descripcionEnfermedades: string;
        descripcionProblema: string;
      };
      direccion: {
        id_direccion: number;
        calle: string;
        numExt: string;
        numInt: string;
        colonia: string;
        cp: number;
        estado: string;
        delegacionMunicipio: string;
        telefonoFijo: number;
        telefonoMovil: number;
        email: string;
        labora: string;
      };
      escolaridad: {
        id_escolaridad: number;
        escuelaProcedencia: string;
        entidadFederativaEscuelaProcedencia: string;
        promedioSecundaria: number;
        promedioNivelMedioSuperior: number;
      };
      padre_tutor: {
        idPadreTutor: number;
        nombreTutor: string;
        rfcTutor: string;
        nombrePadre: string;
        nombreMadre: string;
      };
      Tramites: {
        descripcion: string;
        fechaSolicitud: string;
        id_tramites: number;
        idtramite: number;
        no_boleta: string;
        nombre: string;
      };
      estadog: {
        idEstadoGeneral: number;
        noBoleta: number;
        materiasReprobadas: string;
        materiasNoCursadas: string;
        materiasDesfasadas: string;
        fechaInscripcion: string;
        fechaFinalizacion: string;
        turno: string;
        totalCreditosObtenidos: number;
        totalCreditosFaltantes: number;
        periodosCursados: number;
        periodosDisponibles: number;
        cargaAutorizada: number;
        creditosReprobados: number;
        id_carrera: number;
        carrera: {
          id_carrera: number;
          nombre: string;
          totalCreditos: number;
          cargaMaxima: number;
          cargaMinima: number;
          duracionCarreraEscolares: number;
          duracionMaximaPeriodos: number;
          id_asignaturas: number;
          asignaturas: {
            id_asignatura: number;
            nombre: string;
            docente: string;
            creditos: number;
            clave: string;
            id_Grupos: number;
            grupo: {
              id_grupos: number;
              noGrupo: string;
              id_semestre: number;
              semestre: {
                id_semestre: number;
                noSemestre: number;
              };
            };
          };
        };
      };
    }
}

