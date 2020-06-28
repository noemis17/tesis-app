import { Component, OnInit } from '@angular/core';
import { CarritoService } from '../../../Servicios/carrito.service'

@Component({
  selector: 'app-compra',
  templateUrl: './compra.page.html',
  styleUrls: ['./compra.page.scss'],
})
export class CompraPage implements OnInit {

  CompraProducto:any;
  constructor( private compraServi: CarritoService) { }

  ngOnInit() {
    this.consultarOrdenesCompra();
  }
  consultarOrdenesCompra() {
    this.compraServi.ConsultarOrdenesCompradas(localStorage.getItem("nomeToken"))
      .then((data) =>{
        if(data['code']==""){
          this.CompraProducto=data['items'];
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

}
