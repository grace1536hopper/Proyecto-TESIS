// login.component.ts
import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';
import { CredencialesUsuario } from 'src/app/interfaces/CredencialesUsuario';
import Swal from 'sweetalert2';
import { Ingreso } from '../../interfaces/datos_academicos';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  public formSubmitted = false;

  public loginForm = this.fb.group({
    boleta: [ +localStorage.getItem('boleta') || +'' , [Validators.required]],
    contrasena: ['', Validators.required],
    remember: [false]
  });



  constructor(
    private router: Router,
    private fb: FormBuilder,
    private datosAcademicosService: DatosAcademicosService // se importa el servicio
  ) {}

  ngOnInit(): void {
    // Initialization logic if needed
  }

  login() {

    const credenciales: CredencialesUsuario = {
      boleta: this.loginForm.value.boleta,
      contrasena: this.loginForm.value.contrasena,
    };

    this.datosAcademicosService.login(credenciales)
    .subscribe( resp => {
      if(this.loginForm.get('remember').value){
        localStorage.setItem('boleta', credenciales.boleta.toLocaleString());


      }else{
        localStorage.removeItem('boleta');

      }
      this.router.navigateByUrl('/');
      console.log(resp);

    }, (err) =>{
        Swal.fire('Erro', err.error.msg, 'error');
    })

  }
}


// const credenciales: CredencialesUsuario = {
//   boleta: this.loginForm.value.boleta,
//   contrasena: this.loginForm.value.contrasena,
// };

//   this.datosAcademicosService.login(credenciales).subscribe(
//     (resp) => {
//       console.log(resp);
//       // Aquí puedes redirigir al usuario o realizar otras acciones después del inicio de sesión
//     },
//     (err) => {
//       Swal.fire('Error', err.error.msg, 'error');
//     }
//   );
// }
