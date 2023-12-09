// Importaciones
import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { PagesComponent } from './pages.component';

// Componentes
import { DashboardComponent } from './dashboard/dashboard.component';
import { AccountSettingsComponent } from './account-settings/account-settings.component';
import { CalificacionesComponent } from './calificaciones/calificaciones.component';
import { CitaReinscripcionComponent } from './cita-reinscripcion/cita-reinscripcion.component';
import { ComprobanteComponent } from './comprobante/comprobante.component';
import { DatosPersonalesComponent } from './datos-personales/datos-personales.component';
import { DatosMedicosComponent } from './datos-medicos/datos-medicos.component';
import { DatosDeportivosComponent } from './datos-deportivos/datos-deportivos.component';
import { ExpedienteDaeComponent } from './expediente-dae/expediente-dae.component';
import { SolicitudComponent } from './solicitud/solicitud.component';
import { KardexComponent } from './kardex/kardex.component';
import { EstadoGeneralComponent } from './estado-general/estado-general.component';
import { SolicitudDictamenComponent } from './solicitud-dictamen/solicitud-dictamen.component';
import { HorarioComponent } from './horario/horario.component';
import { ReinscripcionComponent } from './reinscripcion/reinscripcion.component';
import { InscribirEtsComponent } from './inscribir-ets/inscribir-ets.component';
import { InscribirSaberesPreviosComponent } from './inscribir-saberes-previos/inscribir-saberes-previos.component';
import { SaberesPreviosComponent } from './saberes-previos/saberes-previos.component';
import { SeguimientoComponent } from './seguimiento/seguimiento.component';
import { LoginComponent } from '../auth/login/login.component';
import {authGuard} from '../guards/auth.guard';

const routes: Routes = [

    {
        path: 'dashboard',
        component: PagesComponent,
        canActivate: [authGuard],
        children: [
          { path: '', component: DashboardComponent },
          { path: 'account-settings', component: AccountSettingsComponent },
          { path: 'calificaciones', component: CalificacionesComponent },
          { path: 'cita-reinscripcion', component: CitaReinscripcionComponent },
          { path: 'comprobante', component: ComprobanteComponent },
          { path: 'datos-personales', component: DatosPersonalesComponent },
          { path: 'datos-medicos', component: DatosMedicosComponent },
          { path: 'datos-deportivos', component: DatosDeportivosComponent },
          { path: 'expediente-dae', component: ExpedienteDaeComponent },
          { path: 'solicitud', component: SolicitudComponent },
          { path: 'seguimiento', component: SeguimientoComponent },
          { path: 'kardex', component: KardexComponent },
          { path: 'estado-general', component: EstadoGeneralComponent },
          { path: 'solicitud-dictamen', component: SolicitudDictamenComponent },
          { path: 'horario', component: HorarioComponent },
          { path: 'reinscripcion', component: ReinscripcionComponent },
          { path: 'inscribir-ets', component: InscribirEtsComponent },
          { path: 'inscribir-saberes-previos', component: InscribirSaberesPreviosComponent },
          { path: 'saberes-previos', component: SaberesPreviosComponent },
          //{ path: 'login', component: LoginComponent },
          // { path: '', redirectTo: '/dashboard', pathMatch: 'full' },
        ]
      },


    //{ path: 'path/:routeParam', component: MyComponent },
    //{ path: 'staticPath', component: ... },
    //{ path: '**', component: ... },
    //{ path: 'oldPath', redirectTo: '/staticPath' },
    //{ path: ..., component: ..., data: { message: 'Custom' }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class PagesRoutingModule {}
