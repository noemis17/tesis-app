import { Component, OnInit } from '@angular/core';
import { ProductosService} from '../../../Servicios/productos.service';
import { ModalController } from '@ionic/angular';
import {ModalPromocionesPage } from '../modal-promociones/modal-promociones.page';


@Component({
  selector: 'app-producto',
  templateUrl: './producto.page.html',
  styleUrls: ['./producto.page.scss'],
})
export class ProductoPage implements OnInit {
producto:any;

  constructor( private productoServi:ProductosService,private modalC:ModalController) { }

  ngOnInit() {
   this.mostrar();
  }
  mostrar(){
    this.productoServi.mostrarProducto()
    .then(data=>{ 
      if(data['code']=="200"){
        this.producto=data['items'];
      console.log(this.producto);
      }

    });
  }
  loadData(event){
    setTimeout(()=>{
      if (this.producto.length == 50) {
        event.target.complete();
        //this.infiniteScroll.disabled=true;
        return;
      }
      const nuevoArr= Array(20);
      this.producto.push(nuevoArr);
      event.target.complete();
    },100);
   console.log('Cargando siguiente',event);
  }
  async abrirModal(element?){

    const modal = await this.modalC.create({
    component: ModalPromocionesPage,
    componentProps: {
      "Promociones":element
    }
   });
 
   return await modal.present();
 

  }
  





}

