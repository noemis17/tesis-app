import { Component, OnInit } from '@angular/core';
import { ModalController, NavParams, AlertController, ActionSheetController } from '@ionic/angular';
import { Router } from '@angular/router';
import { TipoPagoService } from '../../../Servicios/tipo-pago.service';
import { CarritoService } from '../../../Servicios/carrito.service';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import { RutaService } from '../../../Servicios/Rutas/ruta.service';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
// import { WebView } from '@ionic-native/ionic-webview/ngx';
// import * as  mapboxgl from 'mapbox-gl';
// import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';




declare var google;
@Component({
  selector: 'app-pago',
  templateUrl: './pago.page.html',
  styleUrls: ['./pago.page.scss'],
})
export class PagoPage implements OnInit {
  mapRef = null;
  carritoProducto: any[] = [];
  carritoPromociones: any[] = [];
  tipoPago: any = [];
  totalAPagar: any;
  image: string;
  constructor(
    public alertController: AlertController,
    private modalC: ModalController,
    private router: Router,
    private tipoServicio: TipoPagoService,
    private compraServi: CarritoService,
    private navParams: NavParams,
    private geolocation: Geolocation,
    private loadingCtrl: LoadingController,
    private rutaService: RutaService,
    public actionController: ActionSheetController,
    private camera: Camera

  ) { }
  posicion_: any[] = [];
  dataPosicionCenter: any;
  ngOnInit() {
    //aqui imprima lo que llega que no me acuerdo
    this.carritoProducto = this.navParams.data['producto'];
    this.carritoPromociones = this.navParams.data['promociones'];
    this.totalAPagar = this.navParams.data['total'];
    this.mostrarTipoPago();
    // this.dataPosicionCenter = this.navParams.data['position'];
    // if (localStorage.getItem("ubicacion")==null) {
    //   localStorage.setItem("ubicacion",JSON.stringify(this._marker));
    // }

    // this.posicion();
    //this.obtenerlocalizacion();
    //this.addMarker(posicion_[1],posicion_[0],"");
  }
  mostrarTipoPago() {
    this.tipoServicio.mostrarTipoPago()
      .then(data => {
        if (data['code'] == "200") {
          this.tipoPago = data['items'];
        }
      });
  }
  latitud = 0;
  longitud = 0;
  _marker:any;
  registroPago(item) {
    if (item.identificador == 2) {
      if (this.carritoProducto.find(e => e['PermitirVender'] == false) == undefined && this.carritoPromociones.find(e => e['PermitirVender'] == false) == undefined) {
        this.compraServi.guardarCompra(JSON.stringify(this.carritoPromociones), localStorage.getItem("nomeToken"), JSON.stringify(this.carritoProducto), item.id, this.totalAPagar, JSON.parse(localStorage.getItem("ubicacion"))['lat'], JSON.parse(localStorage.getItem("ubicacion"))['lng'])
          .then((ok) => {
            console.log(ok)
            if (ok['code'] == "200") {
              var setDato: any[] = [];
              localStorage.setItem("carrito", JSON.stringify(setDato));
              localStorage.setItem("carritoPromociones", JSON.stringify(setDato));
              //this.showAlert("Compra realizada exitosamenete");
              this.modalC.dismiss("1");

            }
          })
          .catch((error) => {
            console.log(error);
          });
      } else {
        this.showAlert("Todos los productos no estan disponible");
      }
    } else {
      // aqui va el codigo donde accede a la camara o a la galeria del telefono
      this.presentAlertPrompt();

    }

  }
  async showAlert(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: ['ok']
    });
    await alert.present();
  };
  async closeModal() {
    await this.modalC.dismiss();
  }
  rutadelcarrito() {
    this.router.navigate(['/menu/carrito']);
  }
 

  // @ViewChild('listaTPagos', { static: false }) listaTPagos: ElementRef;
  async presentAlertPrompt() {
    const alert = await this.alertController.create({
      cssClass: 'my-custom-class',
      header: 'Comprobante',
      mode: 'ios',
      inputs: [
        {
          name: 'radio1',
          type: 'radio',
          label: 'Camara',
          value: 'value1',
          checked: true,
          handler: () => {
            console.log('hoohohoh');
            this.takePicture();
          }
        },
        {
          name: 'radio2',
          type: 'radio',
          label: 'galeria',
          value: 'value2',
          handler: () => {
            console.log('hoohohoh');
            this.AccessGallery();
          }
        }
      ],
      buttons: [
        {
          text: 'Cancel',
          role: 'cancel',
          cssClass: 'alertButton',
          handler: () => {
            console.log('Confirm Cancel');
          }
        }, {
          text: 'Ok',
          cssClass: 'alertButton',
          handler: () => {
            console.log('Confirm Ok');
            // let listaTPagosPorId = document.getElementById('listaTPagos');
            // listaTPagosPorId.hidden = true;
            this.guardarDocumentoTransaccion(this.image);
          }
        }
      ]
    });

    await alert.present();
  }
  
// async presentAlertPrompt() {
//   const actionsheet = await this.actionController.create({
//     buttons: [
//       {
//         text: 'Camara',
//         icon: 'camera-outline',
//         handler: () => {
//           this.takePicture();
//         }
//       }, {
//         text: 'Galeria',
//         icon: 'image-outline',
//         handler: () => {
//           this.AccessGallery();
//         }
//       }
//     ],

//   });
//   actionsheet.present();
// }
  takePicture() {
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.DATA_URL,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE,
      sourceType: this.camera.PictureSourceType.CAMERA
    };
    this.camera.getPicture(options)
      .then((imageData) => {
        this.image = 'data:image/jpeg;base64,' + imageData;
      }, (err) => {
        console.log(err);
      });
  }
  AccessGallery() {
    this.camera.getPicture({
      sourceType: this.camera.PictureSourceType.SAVEDPHOTOALBUM,
      destinationType: this.camera.DestinationType.DATA_URL

    }).then((imageData) => {

      this.image = 'data:image/jpeg;base64,' + imageData;

    }, (err) => {

      console.log(err);

    });

  }

  guardarDocumentoTransaccion(_imagen: string) {
    this.compraServi.guardarDocumentoTransaccion(_imagen)
      .then(data => {
        if (data['code'] == '200') {
          console.log('se guardo la imagen');
        } else {
          console.log(data);

        }

      }).catch(error => {
        console.log(error);

      }).finally(() => { });
  }


}
