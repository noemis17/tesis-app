import { Component, OnInit } from '@angular/core';
import { ProductosService } from '../../../Servicios/productos.service';
import { PromocionesService } from '../../../Servicios/promociones.service'
import { CarritoService } from '../../../Servicios/carrito.service'
import { AlertController, NavController} from '@ionic/angular'
import { ModalController,NavParams  } from '@ionic/angular';
import { PagoPage } from '../pago/pago.page';
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
  constructor(private productoServi: ProductosService,
    private promocionServi: PromocionesService,
    private compraServi: CarritoService,
    public alertController: AlertController,
    public navCtrl: NavController,
    private modalC:ModalController
  ) {
  }
  ngOnInit() {
    this.setDatos();
    this.setDatos1();
    //this.consultarOrdenesCompra();

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
      }
    });
    return await modal.present();
  }
  validarubicacion()
  {
    if(this.carritoProducto.length==0 && this.carritoPromociones.length==0){
      this.showAlert("No tiene ningun producto en el carrito");
    }else{
      navigator.geolocation.getCurrentPosition(position => {
        this.abrirModalubicacion(position);
      });
    }
  }
  async abrirModalubicacion(ubicacion?){
    const modal = await this.modalC.create({
      component: UbicacionPage ,
      componentProps: {
        "position":ubicacion
      }
     
     });
     return await modal.present();
     console.log(ubicacion);
   }
  eliminar(carri) {
    let itemIndexProducto = this.carritoProducto.findIndex(item => item.id == carri.id);
    this.carritoProducto.splice(itemIndexProducto, 1);
    //this.carritoProducto = this.carritoProducto.filter(option => option['id']!= carri);
    localStorage.setItem("carrito", JSON.stringify(this.carritoProducto))
    this.setDatos();
    this.setValor();
  }
  setDatos() {
    this.totalAPagar = 0;
    this.carritoProducto = [];
    var lista: any[] = [];
    lista = JSON.parse(localStorage.getItem("carrito"));
    var valor = 0;
    if (lista.length > 0) {
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
    listaPromociones = JSON.parse(localStorage.getItem("carritoPromociones"));
    if (listaPromociones.length>0) {
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
  }
  
  eliminarPromocion(carripro) {
    this.carritoPromociones = this.carritoPromociones.filter(option => option['id'] != carripro);
    localStorage.setItem("carritoPromociones", JSON.stringify(this.carritoPromociones))
    this.setDatos1();
    this.setValor();
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
  async modificarCantidad(carri) {
    const alert = await this.alertController.create({
      mode: "ios",
      header: 'Ingrese la Cantidad a comprar',
      inputs: [
        {
          name: 'cantidad',
          type: 'number',
          value: carri.cantidad,
          placeholder: 'cantidad'
        },

      ],
      buttons: [
        {
          text: 'Cancel',
          handler: () => {
            console.log('Confirm Cancel');
          }
        },
        {
          text: 'ok',
          handler: (data) => {
            if (carri.promocionesdel_producto == null) {
              if (data.cantidad <= carri.stock) {
                let itemIndexProducto = this.carritoProducto.findIndex(item => item.id == carri.id);
                this.carritoProducto[itemIndexProducto]['cantidad'] = data.cantidad;
                localStorage.setItem("carrito", JSON.stringify(this.carritoProducto));
                this.setValor()
                this.showAlert(" Ingreso de cantidad existosa");
              } else {
                this.showAlert("No hay la cantidad necesaria");
              }

            } else {
              if (data.cantidad <= carri.promocionesdel_producto.stock) {
                let itemIndexProducto = this.carritoProducto.findIndex(item => item.id == carri.id);
                this.carritoProducto[itemIndexProducto]['cantidad'] = data.cantidad;
                localStorage.setItem("carrito", JSON.stringify(this.carritoProducto));
                this.showAlert(" Ingreso de cantidad existosa");
              } else {
                this.showAlert("No hay la cantidad necesaria");
              }
            }
          }
        }
      ]

    });
    await alert.present();
  }
  async modificarCantidadKit(carripro) {

    const alert = await this.alertController.create({
      mode: "ios",
      header: 'Ingrese la Cantidad a comprar',
      inputs: [
        {
          name: 'cantidad',
          type: 'number',
          value: carripro.Carritocantidad,
          placeholder: 'cantidad'
        },

      ],
      buttons: [
        {
          text: 'Cancel',
          handler: () => {
            console.log('Confirm Cancel');
          }
        },
        {
          text: 'ok',
          handler: (data) => {
            if (data.cantidad <= carripro.cantidad) {
              let itemIndex = this.carritoPromociones.findIndex(item => item.id == carripro.id);
              this.carritoPromociones[itemIndex]['Carritocantidad'] = data.cantidad;
              localStorage.setItem("carritoPromociones", JSON.stringify(this.carritoPromociones))
              this.setValor()
              this.showAlert("Ingreso de cantidad existosa");
            } else {
              this.showAlert("No hay la cantidad necesaria");
            }
          }
        }
      ]

    });
    await alert.present();

  }
  async showAlert(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: ['ok']
    });
    await alert.present();
  };
  // consultarOrdenesCompra() {
  //   this.compraServi.ConsultarOrdenesCompradas(localStorage.getItem("nomeToken"))
  //     .then((ok) => {
  //       console.log("Ordenes ",ok);
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     });
  // }





}
