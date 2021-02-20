import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ModalController, NavParams, AlertController,ActionSheetController, NavController } from '@ionic/angular';
import { Router } from '@angular/router';
import { TipoPagoService } from '../../../Servicios/tipo-pago.service';
import { CarritoService } from '../../../Servicios/carrito.service';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
//import { PostProvider } from '@ionic/angular';
import { RutaService } from '../../../Servicios/Rutas/ruta.service';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import * as  mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import { FileUploadOptions, FileTransfer,FileTransferObject } from '@ionic-native/file-transfer/ngx';
//import { File } from '@ionic-native/file';
import { ComprobantePage } from '../comprobante/comprobante.page';
import { NotificacionesService } from 'src/app/Servicios/notificaciones.service';
import { LocalNotifications } from '@ionic-native/local-notifications/ngx';
declare var google;
@Component({
  selector: 'app-pago',
  templateUrl: './pago.page.html',
  styleUrls: ['./pago.page.scss'],
})
export class PagoPage implements OnInit {
  mapRef = null;
  verTransferencia=false;
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
    private _notificacionesService: NotificacionesService, 
    public actionController: ActionSheetController,
    private camera: Camera,
    private transfer: FileTransfer,
    private localNotifications: LocalNotifications,

  ) { }
  posicion_: any[] = [];
  dataPosicionCenter: any;
  ngOnInit() {
    //aqui imprima lo que llega que no me acuerdo
    this.carritoProducto = this.navParams.data['producto'];
    this.carritoPromociones = this.navParams.data['promociones'];
    this.totalAPagar = this.navParams.data['total'];
    this.mostrarTipoPago();
    this.dataPosicionCenter = this.navParams.data['position'];
    if (localStorage.getItem("ubicacion")==null) {
      localStorage.setItem("ubicacion",JSON.stringify(this._marker));
    }
    // this.posicion();
    //this.obtenerlocalizacion();
    //this.addMarker(posicion_[1],posicion_[0],"");
    // setInterval(() => {


    //   this._notificacionesService.getNotificaciones(localStorage.getItem('id')).then(data=>{
    //     //crear validacion que si
    //     if (data['code']=='200') {
    //       // this.localNotifications.schedule({
    //       //   title: 'notificacion',
    //       //   id: 1,
    //       //   text: data['items']['mensaje'],
    //       //   // sound: isAndroid? 'file://sound.mp3': 'file://beep.caf',
    //       //   data: { secret:  "key" }
          
    //       // });
    //     } else {
    //       console.log('Producto despachado');
    //     }
      

    //   });
  
    // },60000);
    
   
   
  }
  
  mostrarTipoPago() {
    this.tipoServicio.mostrarTipoPago()
      .then(data => {
        if (data['code'] == "200") {
          this.tipoPago = data['items'];
          console.log( this.tipoPago );
        }
      });
  }
  latitud = 0;
  longitud = 0;
  _marker:any;
  idTipoPago = '';
  async registroPago(item) {
    const loading = await this. loadingCtrl.create({
      message: 'Comprando',
      spinner: 'bubbles'
    });
    await loading.present();
        if (item.identificador == 2) {
          if (this.carritoProducto.find(e => e['PermitirVender'] == false) == undefined && this.carritoPromociones.find(e => e['PermitirVender'] == false) == undefined) {
            this.compraServi.guardarCompra(JSON.stringify(this.carritoPromociones), localStorage.getItem("nomeToken"), JSON.stringify(this.carritoProducto), item.id, this.totalAPagar, JSON.parse(localStorage.getItem("ubicacion"))['lat'], JSON.parse(localStorage.getItem("ubicacion"))['lng'])
              .then((ok) => {
                console.log(ok)
                if (ok['code'] == "200") {
                  var setDato: any[] = [];
                  localStorage.setItem("carrito", JSON.stringify(setDato));
                  localStorage.setItem("carritoPromociones", JSON.stringify(setDato));
                  this.showMensaje("Compra realizada con exito");
                  loading.dismiss();

                }
              })
              .catch((error) => {
                console.log(error);
              });
          } else {
            this.showAlert("Todos los productos no estan disponible");
            loading.dismiss();
          }
        } else {
          // aqui va el codigo donde accede a la camara o a la galeria del telefono

          this.idTipoPago = item.id;
          this.presentAlertPrompt();
          loading.dismiss();
          

        }
        

  }
  async showAlert(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: ['ok'
    
    ]
    });
    await alert.present();
  };
  async showMensaje(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: [
        {
          text: 'Ok',
          // cssClass: 'alertButton',
          handler: () => {
            //this.ionViewWillEnter();
            this.modalC.dismiss("1");
          }
        }
      ]
    });
    await alert.present();
  };
 
  //ionViewWillEnter(){
    //this.router.navigate(['/menu/vista-producto/product']); 
  //}
  

  async closeModal() {
    await this.modalC.dismiss();
  }
  rutadelcarrito() {
    this.router.navigate(['/menu/carrito']);
  }
  @ViewChild('listaTPagos', { static: false }) listaTPagos: ElementRef;
  async presentAlertPrompt() {
    const actionsheet = await this.actionController.create({
      buttons: [
        {
          text: 'Camara',
          icon: 'camera-outline',
          handler: () => {
            this.takePicture();

           
          }
        }, {
          text: 'Galeria',
          icon: 'image-outline',
          handler: () => {
            this.AccessGallery();
           
          }
        }
      ],
  
    });
    actionsheet.present();
  }

  takePicture() {
    this.camera.getPicture({
      destinationType: this.camera.DestinationType.DATA_URL,
      sourceType     : this.camera.PictureSourceType.CAMERA,
      mediaType: this.camera.MediaType.PICTURE
    }).then((imageData) => {
  
        this.image = 'data:image/jpeg;base64,' + imageData;
      //  this.guardarDocumentoTransaccion(this.image);
         this.abrirModaComprobante();
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
      // this.guardarDocumentoTransaccion(this.image);
      this.abrirModaComprobante();
    

    }, (err) => {

      console.log(err);

    });

  }

  async abrirModaComprobante(){
    const modal = await this.modalC.create({
      component: ComprobantePage ,
      componentProps: {
        "comprobate": this.image,
        "pago":this.totalAPagar,
        "promo":this.carritoPromociones,
        "product":this.carritoProducto,
        "tipo":this.idTipoPago,
        
      }
     });
     return await modal.present();
   }
  async showAlertPago(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: [
        {
          text: 'Ok',
          // cssClass: 'alertButton',
          handler: () => {
            this.modalC.dismiss("1");
                }
              }
        ]
    });
    await alert.present();
  };

}
