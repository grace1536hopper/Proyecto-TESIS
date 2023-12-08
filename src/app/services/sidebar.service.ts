import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SidebarService {

  menu: any[] = [
    {
      titulo: 'Información',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Datos Personales', url: 'datos-personales' },
        { titulo: 'Datos Médicos', url: 'datos-medicos' },
        /* { titulo: 'Datos Deportivos', url: 'datos-deportivos' } */
      ]
    },
    /* {
      titulo: 'Expediente DAE',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Expediente DAE', url: 'expediente-dae' },
      ]
    }, */
    {
      titulo: 'Tramites',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Solicitud', url: 'solicitud' },
        { titulo: 'Seguimiento', url: 'seguimiento' }
      ]
    },
    {
      titulo: 'Datos Académico',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Kardex', url: 'kardex' },
        { titulo: 'Estado General', url: 'estado-general' },
      ]
    },
    {
      titulo: 'Inscripción actual',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Horario', url: 'horario' },
        { titulo: 'Calificaciones', url: 'calificaciones' },
        /* { titulo: 'Solicitud Dictamen', url: 'solicitud-dictamen' } */
      ]
    },
    /*{
      titulo: 'Reinscripciones',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Cita de reinscripción', url: 'cita-reinscripcion' },
        { titulo: 'Reinscripción', url: 'reinscripcion' },
        { titulo: 'Comprobante', url: 'comprobante' }
      ]
    },
    {
      titulo: 'ETS',
      icono: 'mdi mdi-gauge',
      submenu: [
        { titulo: 'Inscribir ETS', url: 'inscribir-ets' },
        { titulo: 'Saberes Previos', url: 'saberes-previos' },
        { titulo: 'Inscribir saberes previos', url: 'inscribir-saberes-previos' }
      ]
    } */
  ]

  constructor() { }
}
