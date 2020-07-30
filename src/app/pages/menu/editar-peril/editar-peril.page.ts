import { Component, OnInit } from '@angular/core';
import { ActivatedRoute} from '@angular/router';
import { NavController, NavParams  } from '@ionic/angular';
import { PerfilService } from 'src/app/Servicios/perfil.service';

@Component({
  selector: 'app-editar-peril',
  templateUrl: './editar-peril.page.html',
  styleUrls: ['./editar-peril.page.scss'],
})
export class EditarPerilPage implements OnInit {
  usuario:any ; 
  constructor(public navCtrl: NavController ,public navParams: NavParams, public perfilServi:PerfilService) { 
  
  }

  ngOnInit() {
    this.mostrar();
    }
    mostrar(){
      this.perfilServi.mostrarPerfil(localStorage.getItem("id"))
      .then(data=>{ 
        if(data['code']=="200"){
          this.usuario=data['items'];
        console.log(this.usuario);
        }
  
      });
    }




}
