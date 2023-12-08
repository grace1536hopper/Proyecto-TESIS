import { Component } from '@angular/core';
import {  Ingreso } from 'src/app/interfaces/datos_academicos';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-datos-deportivos',
  templateUrl: './datos-deportivos.component.html',
  styles: [
  ]
})
export class DatosDeportivosComponent {
  datosDeportivos: Ingreso | undefined;
  fechaNacimientoFormateada: string | undefined;

  constructor(private _datosAcademicos: DatosAcademicosService){}

  ngOnInit(): void {
    this.getDatosAcademicos();
  }

  getDatosAcademicos(){
    this._datosAcademicos.getDatosAcademicos().subscribe((data: Ingreso) => {
      this.datosDeportivos = data;
     // this.formatoFechaNacimiento();
      console.log('Datos de alumno', this.datosDeportivos);
    },
    (error) => {
      console.error('Error al obtener datos académicos:', error);
    });
  }

  // formatoFechaNacimiento() {
  //   if (this.datosDeportivos && this.datosDeportivos.DatosAcademicos.fecha_nacimiento) {
  //     const fechaNacimiento = new String(this.datosDeportivos.DatosAcademicos.fecha_nacimiento);
  //     // Formatea la fecha como desees, por ejemplo: "DD/MM/YYYY"
  //     this.fechaNacimientoFormateada = fechaNacimiento.toLocaleDateString('es-ES');
  //   }
  // }
}
