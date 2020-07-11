import { Component, OnInit } from '@angular/core';
import { CarritoService } from '../../../Servicios/carrito.service'
import { Router } from '@angular/router';
@Component({
  selector: 'app-compra',
  templateUrl: './compra.page.html',
  styleUrls: ['./compra.page.scss'],
})
export class CompraPage implements OnInit {

  CompraProducto:any;
  nombre="";
  cedula="";

  constructor( private compraServi: CarritoService, private router:Router) { }

  ngOnInit() {
    this.consultarOrdenesCompra();
  }
  consultarOrdenesCompra() {
    this.compraServi.ConsultarOrdenesCompradas(localStorage.getItem("nomeToken"))
      .then((data) =>{
        if(data['code']==""){

          if(data['items'].length>0){
            this.CompraProducto=data['items'];
          this.nombre=data['items'][0].usuarios.name;
          this.cedula=data['items'][0].usuarios.cedula;
          }
          console.log(this.CompraProducto);
        }

      })
      .catch((error) => {
        console.log(error);
      });
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

  rutadelcarrito(){
    this.router.navigate(['/menu/carrito']);
  }

}
