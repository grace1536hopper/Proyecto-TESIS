import { inject } from '@angular/core';
import { CanActivate, CanActivateFn, Router } from '@angular/router';
import { DatosAcademicosService } from '../services/datos-academicos.service';
import { tap } from 'rxjs';
import { map } from 'rxjs/operators';

export class AuthGuard implements CanActivate {
  constructor(
    private userService: DatosAcademicosService,
    private router: Router
  ) {}

  canActivate(): boolean {
    console.log('pasaste por el canActivate');

    return this.userService.validarToken().pipe(
      tap((estaAutenticado: any) => {
        if (!estaAutenticado) {
          this.router.navigateByUrl('/login');
          // verifica que el usuario esté autenticado
        }
      })
    );
  }
}

