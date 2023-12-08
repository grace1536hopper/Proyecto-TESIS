import { Component } from '@angular/core';
// import { DatosAcademicos } from 'src/app/interfaces/datos_academicos';
import { Ingreso } from 'src/app/interfaces/datos_academicos';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-datos-medicos',
  templateUrl: './datos-medicos.component.html',
  styles: [
  ]
})
export class DatosMedicosComponent {
  datosMedicos: Ingreso | undefined;
  fechaNacimientoFormateada: string | undefined;

  constructor(private _datosAcademicos: DatosAcademicosService){}

  ngOnInit(): void {
    this.getDatosAcademicos();
  }

  getDatosAcademicos(){
    this._datosAcademicos.getDatosAcademicos().subscribe((data: Ingreso) => {
      this.datosMedicos = data;
      //this.formatoFechaNacimiento();
      console.log('Datos de alumno', this.datosMedicos);
    },
    (error) => {
      console.error('Error al obtener datos académicos:', error);
    });
  }
  //datosMedicos es el principal de donde se saca la base de datos
  formatoFechaNacimiento() {
    if (this.datosMedicos && this.datosMedicos.DatosAcademicos.fecha_nacimiento) {
      const fechaNacimiento = new Date(this.datosMedicos.DatosAcademicos.fecha_nacimiento);
      // Formatea la fecha como desees, por ejemplo: "DD/MM/YYYY"
      this.fechaNacimientoFormateada = fechaNacimiento.toLocaleDateString('es-ES');
    }
  }
}
