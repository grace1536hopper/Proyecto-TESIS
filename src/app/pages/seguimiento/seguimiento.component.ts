import { Component } from '@angular/core';
// import { DatosAcademicos } from 'src/app/interfaces/datos_academicos';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-seguimiento',
  templateUrl: './seguimiento.component.html',
  styles: [
  ]
})
export class SeguimientoComponent {
  // seguimiento: DatosAcademicos | undefined;
  // fechaNacimientoFormateada: string | undefined;

  // constructor(private _datosSeguimiento: DatosAcademicosService){}

  // ngOnInit(): void {
  //   this.getDatosAcademicos();
  // }

  // getDatosAcademicos(){
  //   this._datosSeguimiento.getDatosAcademicos().subscribe((data: DatosAcademicos) => {
  //     this.seguimiento = data;
  //     this.formatoFechaNacimiento();
  //     console.log('Datos de alumno', this.seguimiento);
  //     console.log('Datos de alumno', this.seguimiento.Tramites);
  //   },
  //   (error) => {
  //     console.error('Error al obtener datos académicos:', error);
  //   });
  // }

  // get arrayDeTramites(): any[] {
  //   return Object.values(this.seguimiento.Tramites);
  // }

  // formatoFechaNacimiento() {
  //   if (this.seguimiento && this.seguimiento.fecha_nacimiento) {
  //     const fechaNacimiento = new Date(this.seguimiento.fecha_nacimiento);
  //     // Formatea la fecha como desees, por ejemplo: "DD/MM/YYYY"
  //     this.fechaNacimientoFormateada = fechaNacimiento.toLocaleDateString('es-ES');
  //   }
  // }
}
