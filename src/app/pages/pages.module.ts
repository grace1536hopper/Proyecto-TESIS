import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AccountSettingsComponent } from './account-settings/account-settings.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { PagesComponent } from './pages.component';
import { SharedModule } from '../shared/shared.module';
import { RouterModule } from '@angular/router';
import { DatosPersonalesComponent } from './datos-personales/datos-personales.component';
import { DatosMedicosComponent } from './datos-medicos/datos-medicos.component';
import { DatosDeportivosComponent } from './datos-deportivos/datos-deportivos.component';
import { ExpedienteDaeComponent } from './expediente-dae/expediente-dae.component';
import { SolicitudComponent } from './solicitud/solicitud.component';
import { SeguimientoComponent } from './seguimiento/seguimiento.component';
import { KardexComponent } from './kardex/kardex.component';
import { EstadoGeneralComponent } from './estado-general/estado-general.component';
import { SolicitudDictamenComponent } from './solicitud-dictamen/solicitud-dictamen.component';
import { HorarioComponent } from './horario/horario.component';
import { CalificacionesComponent } from './calificaciones/calificaciones.component';
import { CitaReinscripcionComponent } from './cita-reinscripcion/cita-reinscripcion.component';
import { ReinscripcionComponent } from './reinscripcion/reinscripcion.component';
import { ComprobanteComponent } from './comprobante/comprobante.component';
import { InscribirEtsComponent } from './inscribir-ets/inscribir-ets.component';
import { InscribirSaberesPreviosComponent } from './inscribir-saberes-previos/inscribir-saberes-previos.component';
import { SaberesPreviosComponent } from './saberes-previos/saberes-previos.component';

@NgModule({
  declarations: [
    AccountSettingsComponent,
    DashboardComponent,
    PagesComponent,
    DatosPersonalesComponent,
    DatosMedicosComponent,
    DatosDeportivosComponent,
    ExpedienteDaeComponent,
    SolicitudComponent,
    SeguimientoComponent,
    KardexComponent,
    EstadoGeneralComponent,
    SolicitudDictamenComponent,
    HorarioComponent,
    CalificacionesComponent,
    CitaReinscripcionComponent,
    ReinscripcionComponent,
    ComprobanteComponent,
    InscribirEtsComponent,
    InscribirSaberesPreviosComponent,
    SaberesPreviosComponent,
  ],
  exports: [
    AccountSettingsComponent,
    DashboardComponent,
    PagesComponent,
  ],
  imports: [
    CommonModule,
    SharedModule,
    RouterModule
  ]
})
export class PagesModule { }
