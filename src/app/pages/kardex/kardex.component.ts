import { Component } from '@angular/core';
// import { DatosAcademicos } from 'src/app/interfaces/datos_academicos';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-kardex',
  templateUrl: './kardex.component.html',
  styles: [
  ]
})
export class KardexComponent {
  // datosKardex: DatosAcademicos | undefined;
  fechaNacimientoFormateada: string | undefined;

  constructor(private _datosKardex: DatosAcademicosService){}

  ngOnInit(): void {
    this.getDatosAcademicos();
  }

  getDatosAcademicos(){
    // this._datosKardex.getDatosAcademicos().subscribe((data: DatosAcademicos) => {
    //   this.datosKardex = data;
    //   this.formatoFechaNacimiento();
    //   console.log('Datos de alumno', this.datosKardex);
    //   console.log('Asignaturas de alumno', this.datosKardex.datosacademico.kardexes);
    // },
    // (error) => {
    //   console.error('Error al obtener datos académicos:', error);
    // });
  }

  formatoFechaNacimiento() {
    // if (this.datosKardex && this.datosKardex.fecha_nacimiento) {
    //   const fechaNacimiento = new Date(this.datosKardex.fecha_nacimiento);
    //   // Formatea la fecha como desees, por ejemplo: "DD/MM/YYYY"
    //   this.fechaNacimientoFormateada = fechaNacimiento.toLocaleDateString('es-ES');
    // }
  }

  // get arrayDeAsignaturas(): any[] {
  //   return Object.values(this.datosKardex.datosacademico.kardexes);
  // }

}
