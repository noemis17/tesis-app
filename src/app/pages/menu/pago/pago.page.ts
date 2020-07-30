import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { ModalController,NavParams,AlertController, NavController } from '@ionic/angular';
import { Router } from '@angular/router';
import { TipoPagoService} from '../../../Servicios/tipo-pago.service';
import { CarritoService } from '../../../Servicios/carrito.service';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
//import { PostProvider } from '@ionic/angular';
import { RutaService } from '../../../Servicios/Rutas/ruta.service';
import { Camera,CameraOptions} from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';


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
  tipoPago:any = [];
  totalAPagar: any;
  image:string;
  constructor(
    public alertController: AlertController, 
    private modalC:ModalController,
    private router:Router,
    private tipoServicio:TipoPagoService,
    private compraServi: CarritoService,
    private navParams: NavParams,
    private geolocation: Geolocation,
    private loadingCtrl: LoadingController,
    private rutaService: RutaService,
    private camera: Camera
  
    ) { }
  ngOnInit() {
    //aqui imprima lo que llega que no me acuerdo
    this.carritoProducto = this.navParams.data['producto'];
    this.carritoPromociones = this.navParams.data['promociones'];
    this.totalAPagar = this.navParams.data['total'];
    this.mostrarTipoPago();
    this.loadMap();
  }
  mostrarTipoPago(){
    this.tipoServicio.mostrarTipoPago()
    .then(data=>{ 
      if(data['code']=="200"){
        this.tipoPago=data['items'];
      }
    });
  }
 registroPago(item){
   if(item.identificador == 2){
    if (this.carritoProducto.find(e => e['PermitirVender'] == false) == undefined && this.carritoPromociones.find(e => e['PermitirVender'] == false) == undefined) {
      this.compraServi.guardarCompra(JSON.stringify(this.carritoPromociones), localStorage.getItem("nomeToken"), JSON.stringify(this.carritoProducto),item.id,this.totalAPagar,this.latitud,this.longitud)
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
   }else{
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
  async closeModal(){
    await this.modalC.dismiss();
  }
  
rutadelcarrito(){
  this.router.navigate(['/menu/carrito']);
}
UbicacionGuarda()
  {
    this.llamarAPi();
  }
async loadMap() {
  const loading = await this.loadingCtrl.create();
  loading.present();
  const myLatLng = await this.getLocation();
  const mapEle: HTMLElement = document.getElementById('map');
  this.mapRef = new google.maps.Map(mapEle, {
    center: myLatLng,
    zoom: 12
  });
  google.maps.event
  .addListenerOnce(this.mapRef, 'idle', () => {
    loading.dismiss();
    this.addMaker(myLatLng.lat, myLatLng.lng);
  });
  google.maps.event
  .addListener(this.mapRef, 'click', (e) => {
    loading.dismiss();
    this.addMaker(e.latLng.lat(), e.latLng.lng());
  });
}
latitud:number=0;
longitud:number=0;
listaMarker:any[]=[];
private addMaker(lat: number, lng: number) {
  this.listaMarker.map(item=>{
    item.setMap(null);
  });
  const marker = new google.maps.Marker({
    position: { lat, lng },
    map: this.mapRef,
    title: 'Hello World!'
  });
  this.listaMarker.push(marker);
  this.longitud = lng;
  this.latitud = lat;
  console.log("latitud",this.latitud);
  console.log("longitud",this.longitud);
}
 llamarAPi(){
    this.rutaService.guardarUbicacion(
      '2y10kuJotplmz7rJALTZhnVazeLMPXN6PIExs2LTInVRZqGJfDqUQa',
      this.latitud,this.longitud,
      '').then(data=>{
        console.log(data)
      }).catch(error=>{
        console.log(error)
      })
  }

  private async getLocation() {
    const rta = await this.geolocation.getCurrentPosition();
    return {
      lat: rta.coords.latitude,
      lng: rta.coords.longitude
    };
  }
  async hola(){
    console.log('hola');
  }

  @ViewChild('listaTPagos',{static:false}) listaTPagos: ElementRef;
  
  async presentAlertPrompt() {
    const alert = await this.alertController.create({
      cssClass: 'my-custom-class',
      header: 'Comprobante',
      mode:'ios',
  
      inputs: [
        {
          name: 'radio1',
          type: 'radio',
          label: 'Camara',
          value: 'value1',
          checked: true,
          handler:()=>{
            console.log('hoohohoh');
            this.takePicture();
          }
        },
        {
          name: 'radio2',
          type: 'radio',
          label: 'galeria',
          value: 'value2',
          handler:()=>{
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
            
            let listaTPagosPorId = document.getElementById('listaTPagos');
            listaTPagosPorId.hidden = true;
            this.guardarDocumentoTransaccion(`data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUA
            AAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO
                9TXL0Y4OHwAAAABJRU5ErkJggg==`);
            
          }
        }
      ]
    });

    await alert.present();
  }
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

  AccessGallery(){
    this.camera.getPicture({
      sourceType: this.camera.PictureSourceType.SAVEDPHOTOALBUM,
       destinationType: this.camera.DestinationType.DATA_URL
   
      }).then((imageData) => {
   
        this.image= 'data:image/jpeg;base64,'+imageData;

           }, (err) => {
   
        console.log(err);
   
      });
   
   }

  @ViewChild('mapa' ,{static:false}) mapa : ElementRef;
  ocultarMapa(){
    let mapap = document.getElementById('map');
    mapap.hidden = true;
  }

  guardarDocumentoTransaccion(_imagen:string){
    this.compraServi.guardarDocumentoTransaccion(_imagen)
        .then(data=>{
          if (data['code']=='200') {
            console.log('se guardo la imagen');
          } else {
            console.log(data);
            
          }
          
        }).catch(error=>{
          console.log(error);
          
        }).finally(()=>{});
  }


}
