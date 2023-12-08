import { inject } from '@angular/core';
import { CanActivate, CanActivateFn, Router } from '@angular/router';
import { DatosAcademicosService } from '../services/datos-academicos.service';
import { tap } from 'rxjs';
import { map } from 'rxjs/operators';

// export const authGuard: CanActivateFn = (route, state) => {
//   const userService = inject(DatosAcademicosService);
//   const router = inject(Router);

//   console.log('pasaste por el canActivate');

//   return this.userService.validarToken().pipe(
//     tap((estaAutenticado: any ) => {
//       if(! estaAutenticado){
//         router.navigateByUrl('/login');
//         // verifica que el usuario este autenticado
//       }
//     })
//   )

// };


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



 // .pipe(
  //   tap((estaAutenticado: any ) => {
  //     if(! estaAutenticado){
  //       router.navigateByUrl('/login');
  //       // verifica que el usuario este autenticado
  //     }
  //   })
  // )


  // pipe(
  //   map((resp) => {
  //     console.log(resp);
  //     // Devuelve true si el token es válido, de lo contrario, redirige a la página de login
  //     if (resp) {
  //       return true;
  //     } else {
  //       router.navigate(['/login']);
  //       return false;
  //     }
  //   })
  // );
