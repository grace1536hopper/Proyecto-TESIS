import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, catchError, map, of, tap } from 'rxjs';
// import { DatosAcademicos, Ingreso } from '../interfaces/datos_academicos';
import { Router } from '@angular/router';
import { Ingreso } from '../interfaces/datos_academicos';
import { CredencialesUsuario } from '../interfaces/CredencialesUsuario';
import { usuario } from '../models/usuario.model';

@Injectable({
    providedIn: 'root'
})
export class DatosAcademicosService {
  [x: string]: any;

    private backendUrl: string;
    private myApiUrl: string;
    private id: number;


    constructor(private http: HttpClient,
      private router:Router
      ){
        this.backendUrl = 'http://localhost:3000/';
       this.myApiUrl = 'api/';

        // this.myApiUrl = 'api/login/';
        this.id = 2;
    }

    logout(){
      localStorage.removeItem('token');
      this.router.navigateByUrl('/login');
    }

  validarToken(): Observable<boolean>{
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
      catchError(error => of(false))
    );
  }



    getDatosAcademicos(){
       return this.http.get<Ingreso>(`${this.backendUrl}${this.myApiUrl}alumno/${this.id}`)
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

