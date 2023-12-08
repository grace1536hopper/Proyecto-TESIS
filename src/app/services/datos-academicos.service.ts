import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, map, of, tap } from 'rxjs';
// import { DatosAcademicos } from '../interfaces/datos_academicos';
import { Router } from '@angular/router';
import { Ingreso } from '../interfaces/datos_academicos';
import { CredencialesUsuario } from '../interfaces/CredencialesUsuario';

@Injectable({
    providedIn: 'root'
})
export class DatosAcademicosService {
  [x: string]: any;

    private backendUrl: string;
    private myApiUrl: string;
    private id: number;

    constructor(private http: HttpClient){
        this.backendUrl = 'http://localhost:3000/';
       this.myApiUrl = 'api/';

        // this.myApiUrl = 'api/login/';
        this.id = 1;
    }


  validarToken(): Observable<boolean> {
    const token = localStorage.getItem('token') || '';

    return this.http.get<Ingreso>(`${this.backendUrl}${this.myApiUrl}login/renew`, {
      headers: {
        'x-token': token,
      },
    }).pipe(
      tap((resp: any) => {
        // Verifica la lógica de renovación del token y actualiza el token en localStorage
        localStorage.setItem('token', resp.token);
      }),
      map(resp => true),
      catchError(error => {
        console.error('Error al validar token:', error);

        // Antes de redirigir, puedes realizar otras acciones si es necesario

        // Elimina el token del almacenamiento local
        localStorage.removeItem('token');
        console.log('Token eliminado:', localStorage.getItem('token'));

        // Redirige al usuario al login
        //this.router.navigate('/login');

        // Devuelve un observable de `false` para indicar que la validación ha fallado
        return of(false);
      })
    );
  }





  //   // peticion al backend
  //   return this.http.get<Ingreso>(`${this.backendUrl}${this.myApiUrl}login/renew`, {
  //     headers: {
  //       'x-token': token,
  //     }
  //   }).pipe(
  //     tap((resp: any) => {
  //       // Verifica la lógica de renovación del token y actualiza el token en localStorage
  //       localStorage.setItem('token', resp.token);
  //     }),
  //     map(resp => true),
  //     catchError(error => {
  //       console.error('Error al validar token:', error);
  //       console.log('Antes de borrar el token:', localStorage.getItem('token'));
  //       localStorage.removeItem('token');
  //       console.log('Después de borrar el token:', localStorage.getItem('token'));
  //       return of(false);
  //     })
  //   );
  // }



    getDatosAcademicos(){
       return this.http.get<Ingreso>(`${this.backendUrl}${this.myApiUrl}alumno/${this.id}`);
    }

    login(formData: CredencialesUsuario){
      return this.http.post(`${this.backendUrl}${this.myApiUrl}login`, formData)
      .pipe(
        tap( (resp: any) => {
          localStorage.setItem('token',resp.token)
        })
      )
    }


}



    // login(credenciales: CredencialesUsuario): Observable<CredencialesUsuario> {
    //   return this.http.get<DatosAcademicos>(`${this.backendUrl}${this.myApiUrl}${this.id}`)
    //     .pipe(
    //       map(datos => ({
    //         boleta: datos.boleta,
    //         contrasena: datos.contrasena,
    //       }))
    //     );
    //     }
