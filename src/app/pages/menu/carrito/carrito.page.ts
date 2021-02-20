import { Component, OnInit } from '@angular/core';
import { ProductosService } from '../../../Servicios/productos.service';
import { PromocionesService } from '../../../Servicios/promociones.service'
import { CarritoService } from '../../../Servicios/carrito.service'
import { AlertController, NavController} from '@ionic/angular'
import { ModalController,NavParams  } from '@ionic/angular';
import { PagoPage } from '../pago/pago.page';
import { Router } from '@angular/router';
import { UbicacionPage } from '../ubicacion/ubicacion.page';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import * as  mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import MapboxDirections from 'mapbox-gl-directions';
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions'
import 'mapbox-gl/dist/mapbox-gl.css' // Updating node module will keep css up to date.
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css' // Updating node module will keep css up to date
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.page.html',
  styleUrls: ['./carrito.page.scss'],
})
export class CarritoPage implements OnInit {
  carritoProducto: any[] = [];
  carritoPromociones: any[] = [];
  productoid: any;
  totalAPagar: any;
  ubicacion:any;
  direccion:any;
  constructor(private productoServi: ProductosService,
    private promocionServi: PromocionesService,
    private compraServi: CarritoService,
    public alertController: AlertController,
    public navCtrl: NavController,
    private modalC:ModalController,
    private router: Router,
    private geolocation: Geolocation
  ) {
  }
  ngOnInit() {
    this.setDatos();
    this.setDatos1();
    //this.consultarOrdenesCompra();
    this.ubicacion=localStorage.getItem("ubicacion");
    this.direccion=localStorage.getItem("direcion");
  }
  //Permite abril una modal
  validarCarrito()
  {
    if(this.carritoProducto.length==0 && this.carritoPromociones.length==0){
      this.showAlert("No tiene ningun producto en el carrito");
    }else{
      this.abrirModal();
      // navigator.geolocation.getCurrentPosition(position => {
      //   this.abrirModal();
      // });
    }
  }


  async abrirModal(){
      const modal = await this.modalC.create({
      component:PagoPage ,
      componentProps: {
        "producto":this.carritoProducto,
        "promociones":this.carritoPromociones,
        "total":this.totalAPagar,
        // "position":posicion
      }
    });
    modal.onDidDismiss().then(data => {
      if(data['data']=="1"){
        this.totalAPagar = 0;
        this.carritoProducto = [];
        this.carritoPromociones = [];
        this.router.navigate(['/menu/vista-producto/product']);
      }
    });
    return await modal.present();
  }
  validarubicacion()
  {
    if(Number(this.carritoProducto.length)==0 && Number(this.carritoPromociones.length)==0){
      this.showAlert("No tiene ningun producto en el carrito");
    }else{
      this.abrirModalubicacion();
    }
  }
  async abrirModalubicacion(){
    const modal = await this.modalC.create({
      component: UbicacionPage ,
      componentProps: {}
     });
     modal.onDidDismiss().then(data => {
      this.ubicacion=localStorage.getItem("ubicacion");
      this.direccion=localStorage.getItem("direcion");
    });
     return await modal.present();
   }
  eliminar(carri) {
    let itemIndexProducto = this.carritoProducto.findIndex(item => item.id == carri.id);
    this.carritoProducto.splice(itemIndexProducto, 1);
    var i=0;
    var stringDato="";
    this.carritoProducto.map(e=>{
      if(i==0){
        stringDato=JSON.stringify(e);
      }else{
        stringDato+=","+JSON.stringify(e);
      }
      i++;
    });
    if(stringDato==""){
      localStorage.setItem("carrito", "[]")
    }else{
      localStorage.setItem("carrito", stringDato)
    }
    this.setDatos();
    this.setValor();
  }
  setDatos() {
    //console.log(JSON.parse("["+localStorage.getItem("carrito")+"]"));
    this.totalAPagar = 0;
    this.carritoProducto = [];
    var lista: any[] = [];
    var valor = 0;
    if (typeof(JSON.parse("["+localStorage.getItem("carrito")+"]")[0].length) != "number") {
      lista = JSON.parse("["+localStorage.getItem("carrito")+"]");
      lista.map(e => {
        if (e['cantidad'] != null) {
          this.productoServi.mostrarProductoId(e['id'])
            .then(data => {
              if (data['code'] == "200") {
                valor = 0;
                data['items']['cantidad'] = e['cantidad'];
                if (data['items']['promocionesdel_producto'] == null) {
                  if (e['cantidad'] > data['items']['stock']) {
                    data['items']['PermitirVender'] = false;
                    this.carritoProducto.push(data['items']);
                  } else {
                    data['items']['PermitirVender'] = true;
                    this.carritoProducto.push(data['items']);
                  }
                  valor = data['items']['PRICE'] * e['cantidad'];
                } else {
                  if (e['cantidad'] > data['items']['promocionesdel_producto']['stock']) {
                    data['items']['PermitirVender'] = false;
                    this.carritoProducto.push(data['items']);
                  } else {
                    data['items']['PermitirVender'] = true;
                    this.carritoProducto.push(data['items']);
                  }
                  var descontado = ((data['items']['PRICE'] * e['cantidad']) * data['items']['promocionesdel_producto']['descuento']) / 100;
                  valor = data['items']['PRICE'] - descontado;
                }
              }
            }).catch(error => {
            }).finally(() => {
              this.totalAPagar = parseFloat(this.totalAPagar) + parseFloat(valor.toString());
            });
        }
      });
    }
  }
  lista: any[] = [];
  setDatos1() {
    this.carritoPromociones = [];
    var listaPromociones: any[] = [];
    //listaPromociones = JSON.parse(localStorage.getItem("carritoPromociones"));
    if (typeof(JSON.parse("["+localStorage.getItem("carritoPromociones")+"]")[0].length) != "number") {
    //if (listaPromociones.length>0) {
    listaPromociones = JSON.parse("["+localStorage.getItem("carritoPromociones")+"]");
      listaPromociones.map(e => {
        if (e['cantidad'] != null) {
          this.promocionServi.mostrarRegistroId(e['id'])
            .then(data => {
              if (data['code'] == "200") {
                data['items']['PrecioPromocionConDescuento'] = e['PrecioPromocionConDescuento'];
                data['items']['PrecioSinDescuento'] = e['PrecioSinDescuento'];
                data['items']['ValorDescontado'] = e['ValorDescontado'];
                //data['items']['cantidad'] = e['cantidad'];
                data['items']['Carritocantidad'] = e['cantidad'];
                if (e['cantidad'] > data['items']['cantidad']) {
                  data['items']['PermitirVender'] = false;
                  this.carritoPromociones.push(data['items']);
                } else {
                  data['items']['PermitirVender'] = true;
                  this.carritoPromociones.push(data['items']);
                }
                this.totalAPagar = parseFloat(this.totalAPagar) + ((e['cantidad']) * parseFloat(data['items']['PrecioPromocionConDescuento'].toString()));
              }
            })
        }
      });
    }
    console.log(this.carritoPromociones)
  }

  eliminarPromocion(carripro) {
    let itemIndexProducto = this.carritoPromociones.findIndex(item => item.id == carripro);
    this.carritoPromociones.splice(itemIndexProducto, 1);
    var i=0;
    var stringDato="";
    this.carritoPromociones.map(e=>{
      if(i==0){
        stringDato=JSON.stringify(e);
      }else{
        stringDato+=","+JSON.stringify(e);
      }
      i++;
    });
    if(stringDato==""){
      localStorage.setItem("carritoPromociones", "[]")
    }else{
      localStorage.setItem("carritoPromociones", stringDato)
    }
    this.setDatos1();
    this.setValor();

    //this.carritoPromociones = this.carritoPromociones.filter(option => option['id'] != carripro);
    //localStorage.setItem("carritoPromociones", JSON.stringify(this.carritoPromociones))
  }
  //funcion para modificar cantidad
  setValor() {
    this.totalAPagar = 0;
    this.carritoPromociones.map(data => {
      this.totalAPagar = parseFloat(this.totalAPagar) + parseFloat(data['PrecioPromocionConDescuento'].toString()) * data['Carritocantidad'];
    });
    this.carritoProducto.map(data => {
      if (data['promocionesdel_producto'] == null) {
        this.totalAPagar = this.totalAPagar + (data['PRICE'] * data['cantidad'])
      } else {
        var descontado = ((data['PRICE'] * data['cantidad']) * data['promocionesdel_producto']['descuento']) / 100;
        this.totalAPagar = this.totalAPagar + (data['PRICE'] - descontado);
      }
    });
    //console.log(this.carritoProducto);
    //console.log(this.carritoPromociones);
  }
  async modificarCantidad(carri,event) {
    let itemIndexProducto = this.carritoProducto.findIndex(item => item.id == carri.id);
    if (Number(event.target.value) <= 0) {
      this.carritoProducto[itemIndexProducto]['cantidad'] = 1;
    }else{
      if (carri.promocionesdel_producto == null) {
        if (Number(event.target.value) <= Number(carri.stock)) {
          this.carritoProducto[itemIndexProducto]['cantidad'] = event.target.value;
          // localStorage.setItem("carrito", JSON.stringify(this.carritoProducto));
          // this.setValor();
        } else {
          this.carritoProducto[itemIndexProducto]['cantidad'] = 1;
          this.showAlert("No hay la cantidad necesaria");
        }
      } else {
        if (Number(event.target.value) <= Number(carri.promocionesdel_producto.stock)) {
          this.carritoProducto[itemIndexProducto]['cantidad'] = event.target.value;
          // localStorage.setItem("carrito", JSON.stringify(this.carritoProducto));
        } else {
          this.carritoProducto[itemIndexProducto]['cantidad'] = 1;
          this.showAlert("No hay la cantidad necesaria");
        }
      }
    }
    localStorage.setItem("carrito", JSON.stringify(this.carritoProducto));
    this.setValor();
  }
  async modificarCantidadKit(carripro,event) {
    let itemIndex = this.carritoPromociones.findIndex(item => item.id == carripro.id);
    if (Number(event.target.value) <= 0) {
      this.carritoProducto[itemIndex]['Carritocantidad'] = 1;
    }else{
      if (Number(event.target.value) <= Number(carripro.cantidad)) {
        this.carritoPromociones[itemIndex]['Carritocantidad'] = event.target.value;
        // localStorage.setItem("carritoPromociones", JSON.stringify(this.carritoPromociones))
        // this.setValor()
      } else {
        this.carritoPromociones[itemIndex]['Carritocantidad'] = 1;
        this.showAlert("No hay la cantidad necesaria");
      }
    }
    localStorage.setItem("carritoPromociones", JSON.stringify(this.carritoPromociones))
    this.setValor()
  }
  async showAlert(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: ['ok']
    });
    await alert.present();
  };






}
