import { Component, OnInit } from '@angular/core';
import { TransportistaService} from '../../../Servicios/transportista.service'
import { Router } from '@angular/router';
import {MapaPage } from '../mapa/mapa.page';
import { ModalController,NavParams  } from '@ionic/angular';
@Component({
  selector: 'app-orden',
  templateUrl: './orden.page.html',
  styleUrls: ['./orden.page.scss'],
})
export class OrdenPage implements OnInit {
  Orden:any;
  constructor(private OrdenServi: TransportistaService, private router:Router,private modalC:ModalController) { }

  ngOnInit() {
    this.mostrar();
  }
  mostrar(){
    this.OrdenServi.mostrarOrden(localStorage.getItem("id"))
    .then(data=>{
      if(data['code']=="200"){
        this.Orden=data['items'];
     console.log(this.Orden);
      }

    }).catch((error) => console.log(error))
      .finally(
      )
  }

  async abrirModal(element?){
    const modal = await this.modalC.create({
    component: MapaPage ,
    componentProps: {
      "orden":element,
      "identificador":1
    }

   });

   return await modal.present();


  }
  textoBuscar: string = '002';
  segmentChanged(event){
    // if (event.target.value==="pedidos") {
    //   this.textoBuscar = '001';
    // } else 
    if(event.target.value==="en_proceso") {
      this.textoBuscar = '002';
    } else if(event.target.value==="finalizados") {
      this.textoBuscar = '003';
    }
    console.log(event.target.value);
    
  }
 

rutadelUsuario(){
  this.router.navigate(['/menu/perfil']);
}

}
