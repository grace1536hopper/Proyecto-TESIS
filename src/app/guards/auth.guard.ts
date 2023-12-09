import { ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { Observable, tap } from 'rxjs';
import { DatosAcademicosService } from '../services/datos-academicos.service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})

export class authGuard implements CanActivate {

  constructor(
    private userService: DatosAcademicosService,
    private router: Router
    ) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

    return this.userService.validarToken().pipe(
      tap((estaAutenticado: any ) => {
        if(! estaAutenticado){
          this.router.navigateByUrl('/login');
          // verifica que el usuario este autenticado
        }
      })
    );

      // return false;
}


}



// ----
 // return userService.validarToken();

  // return userService.validarToken().pipe(
  //   tap((estaAutenticado: any ) => {
  //     if(! estaAutenticado){
  //       router.navigateByUrl('/login');
  //       // verifica que el usuario este autenticado
  //     }
  //   })

