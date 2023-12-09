import { Component } from '@angular/core';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styles: [
  ]
})
export class HeaderComponent {

  constructor( private usuarioService:  DatosAcademicosService)
  {  }

  logout(){
    this.usuarioService.logout();
  }
}
