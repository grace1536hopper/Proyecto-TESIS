import { Component } from '@angular/core';
// import { DatosAcademicos } from 'src/app/interfaces/datos_academicos';
import { Ingreso } from 'src/app/interfaces/datos_academicos';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-datos-personales',
  templateUrl: './datos-personales.component.html',
  styles: [
  ]
})
export class DatosPersonalesComponent {
  credencial: Ingreso | undefined;
  fechaNacimientoFormateada: string | undefined;

  constructor(private _datosAcademicos: DatosAcademicosService){}

  ngOnInit(): void {
    this.getDatosAcademicos();
  }

  getDatosAcademicos(){
    this._datosAcademicos.getDatosAcademicos().subscribe((data: Ingreso) => {
      this.credencial = data;
      this.formatoFechaNacimiento();
      console.log('Datos de alumno', this.credencial);
      console.log('Datos de alumno', this.credencial.DatosAcademicos.escolaridad);
    },
    (error) => {
      console.error('Error al obtener datos académicos:', error);
    });
  }

  formatoFechaNacimiento() {
    if (this.credencial && this.credencial.DatosAcademicos.fecha_nacimiento) {
      const fechaNacimiento = new Date(this.credencial.DatosAcademicos.fecha_nacimiento);
      // Formatea la fecha como desees, por ejemplo: "DD/MM/YYYY"
      this.fechaNacimientoFormateada = fechaNacimiento.toLocaleDateString('es-ES');
    }
  }
}
