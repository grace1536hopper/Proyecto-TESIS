import { Component } from '@angular/core';
import { DatosAcademicosService } from 'src/app/services/datos-academicos.service';
import { SidebarService } from 'src/app/services/sidebar.service';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styles: [
  ]
})
export class SidebarComponent {

  menuItems: any[];

  constructor(private sidebarService: SidebarService,
    private usuarioService:  DatosAcademicosService
    ) {
    this.menuItems = sidebarService.menu;
    //console.log(this.menuItems)
  }

  logout(){
    this.usuarioService.logout();
  }

}
