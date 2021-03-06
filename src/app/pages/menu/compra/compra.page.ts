import { Component, OnInit } from '@angular/core';
import { CarritoService } from '../../../Servicios/carrito.service'
import { Router } from '@angular/router';
import {MapaPage } from '../mapa/mapa.page';
import { ModalController,NavParams  } from '@ionic/angular';
@Component({
  selector: 'app-compra',
  templateUrl: './compra.page.html',
  styleUrls: ['./compra.page.scss'],
})
export class CompraPage implements OnInit {

  CompraProducto:any;
  nombre="";
  cedula="";

  constructor( private compraServi: CarritoService, private router:Router,private modalC:ModalController) { }

  ngOnInit() {
    this.consultarOrdenesCompra();
  }
  fechaInicio="";
  fechaFin="";
  consultarOrdenesCompra() {
    this.compraServi.ConsultarOrdenesCompradas(localStorage.getItem("nomeToken"),this.fechaInicio,this.fechaFin)
      .then((data) =>{
        console.log(data);
        if(data['code']==""){
          this.CompraProducto = [];
          if(data['items'].length>0){
          this.CompraProducto=data['items'];
          this.nombre=data['items'][0].usuarios.name;
          this.cedula=data['items'][0].usuarios.cedula;
          }
        }
      })
      .catch((error) => {
        console.log(error);
      });
  }
  textoBuscar='';
  buscar(evento){
    const texto=evento.target.value;
    this.textoBuscar=texto;
  }
  expandItem(item): void {
    if (item.expanded) {
      item.expanded = false;
    } else {
      this.CompraProducto.map(listItem => {
        if (item == listItem) {
          listItem.expanded = !listItem.expanded;
        } else {
          listItem.expanded = false;
        }
        return listItem;
      });
    }
  }
  async abrirModal(element?){
    const modal = await this.modalC.create({
    component: MapaPage ,
    componentProps: {
      "orden":element,
      "identificador":2
    }
   });
   return await modal.present();
  }
  
  rutadelcarrito(){
    this.router.navigate(['/menu/carrito']);
  }

}
