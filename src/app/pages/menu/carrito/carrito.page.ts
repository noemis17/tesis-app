import { Component, OnInit } from '@angular/core';
import { ProductosService } from '../../../Servicios/productos.service';
import { PromocionesService } from '../../../Servicios/promociones.service'
import { CarritoService } from '../../../Servicios/carrito.service'
import { AlertController, NavController} from '@ionic/angular'

import { PayPal, PayPalPayment, PayPalConfiguration,  PayPalPaymentDetails} from '@ionic-native/paypal/ngx';
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
    private payPal:PayPal, 
    public navCtrl: NavController
  ) {
  }
  ngOnInit() {
    this.setDatos();
    this.setDatos1();
    this.consultarOrdenesCompra();
  
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
    if (listaPromociones.length > 0) {
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

  registroCompra() {
    if (this.carritoProducto.find(e => e['PermitirVender'] == false) == undefined && this.carritoPromociones.find(e => e['PermitirVender'] == false) == undefined) {
      this.compraServi.guardarCompra(JSON.stringify(this.carritoPromociones), localStorage.getItem("nomeToken"), JSON.stringify(this.carritoProducto))
        .then((ok) => {
          console.log(ok)
          if (ok['code'] == "200") {
            var setDato: any[] = [];
            localStorage.setItem("carrito", JSON.stringify(setDato));
            localStorage.setItem("carritoPromociones", JSON.stringify(setDato));
            this.setDatos();
            this.setDatos1();
            this.showAlert("Compra realizada exitosamenete");
          }
        })
        .catch((error) => {
          console.log(error);
        });
    } else {
      this.showAlert("Todos los productos no estan disponible");
    }
  }
  consultarOrdenesCompra() {
    this.compraServi.ConsultarOrdenesCompradas(localStorage.getItem("nomeToken"))
      .then((ok) => {
        console.log("Ordenes ",ok);
      })
      .catch((error) => {
        console.log(error);
      });
  }
 comprar(){
    this.payPal.init({
        PayPalEnvironmentProduction: '',
        PayPalEnvironmentSandbox:'AVgkq99IooTEcBVPU_Xo93RH5SkNFMy9vufiV5qnsDPusqvLWyzkvFeTYq5fC27LCWOMEkk_Vl-40cIA'
    }).then(() => {
      this.payPal.prepareToRender('PayPalEnvironmentSandbox', new PayPalConfiguration({
        acceptCreditCards: true,
        languageOrLocale: 'pt-BR',
        merchantName: 'CanalDoAbranches',
        merchantPrivacyPolicyURL: '',
        merchantUserAgreementURL: ''
      })).then(() => {
        let detail = new PayPalPaymentDetails('19.99', '0.00', '0.00');
        let payment = new PayPalPayment('19.99', 'USD', 'CanalDoAbranches', 'Sale', detail);
        this.payPal.renderSinglePaymentUI(payment).then((response) => {
          console.log('pagamento efetuado')
        }, () => {
          console.log('erro ao renderizar o pagamento do paypal');
        })
      })
    })
  }

  


}
