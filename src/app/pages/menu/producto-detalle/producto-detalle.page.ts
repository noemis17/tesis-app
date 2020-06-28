import { Component, OnInit } from '@angular/core';
import { ProductosService } from "../../../Servicios/productos.service";
@Component({
  selector: 'app-producto-detalle',
  templateUrl: './producto-detalle.page.html',
  styleUrls: ['./producto-detalle.page.scss'],
})
export class ProductoDetallePage implements OnInit {

  constructor(
    private productoService:ProductosService,
  ) { }

  ItemProducto:any="";

  ngOnInit() {
    this.productoService.mostrarProductoId(localStorage.getItem("IdItemProducto"))
      .then(data=>{
        console.log("NOemi y DOwlo",data);
        this.ItemProducto=data['items'];
      }).catch(error=>{}).finally(()=>{});
    ;
  }

}
