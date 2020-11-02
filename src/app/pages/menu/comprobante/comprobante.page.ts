import { Component, OnInit } from '@angular/core';
import { ModalController, NavParams, AlertController} from '@ionic/angular';
import { FileUploadOptions, FileTransfer,FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { Router } from '@angular/router';
@Component({
  selector: 'app-comprobante',
  templateUrl: './comprobante.page.html',
  styleUrls: ['./comprobante.page.scss'],
})
export class ComprobantePage implements OnInit {
  image:string;
  carritoProducto: any[] = [];
  carritoPromociones: any[] = [];
  idTipoPago: '';

  totalAPagar: any;

  constructor( private modalC: ModalController, private navParams: NavParams,
    public alertController: AlertController,
    private transfer: FileTransfer,
    private router: Router,

    ) { }

  ngOnInit() {
    this.image= this.navParams.data['comprobate'];
    this.totalAPagar = this.navParams.data['pago'];
    this.carritoPromociones = this.navParams.data['promo'];
    this.carritoProducto = this.navParams.data['product'];
    this.idTipoPago = this.navParams.data['tipo'];
 
  }

  async closeModal() {
    await this.modalC.dismiss();
  }
  guardarDocumentoTransaccion(_imagen: string) {
    // debugger
    const fileTransfer: FileTransferObject = this.transfer.create();
  //  let params:datos[]=[]; 
    
   // params.push({nombre:'tomas', apellido:'loor'});
    let options: FileUploadOptions = {
      fileKey: 'file',
      fileName: 'imagen.jpg',
      chunkedMode: false,
      httpMethod: 'post',
      mimeType: 'image/jpeg',
      //params : params,
       headers: {}
   }
  //  console.log(_imagen)
  //   console.log(localStorage.getItem("nomeToken"))
  //   console.log(this.idTipoPago)
  //   console.log(this.totalAPagar)
  //   console.log(JSON.parse(localStorage.getItem("ubicacion"))['lat'])
  //   console.log(JSON.parse(localStorage.getItem("ubicacion"))['lng'])
  //   console.log(JSON.stringify(this.carritoPromociones))
  //   console.log(JSON.stringify(this.carritoProducto))
   fileTransfer.upload(_imagen, 'https://blooming-plateau-78501.herokuapp.com/api/v0/guardarDocumentoTransaccion/'+localStorage.getItem("nomeToken")+"/"+this.idTipoPago+"/"+this.totalAPagar+"/"+JSON.parse(localStorage.getItem("ubicacion"))['lat']+"/"+JSON.parse(localStorage.getItem("ubicacion"))['lng']+"/"+JSON.stringify(this.carritoPromociones)+"/"+JSON.stringify(this.carritoProducto), options)
    .then((data) => {
       var setDato: any[] = [];
              localStorage.setItem("carrito", JSON.stringify(setDato));
              localStorage.setItem("carritoPromociones", JSON.stringify(setDato));
              this.showAlertPago("Compra exitosa");
  
    }, (err) => {
      // error
      //  debugger
      alert("error"+JSON.stringify(err));
      console.log("error"+JSON.stringify(err))
    });

  
  }
  async showAlertPago(Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: [
        {
          text: 'Ok',
          // cssClass: 'alertButton',
          handler: () => {
            this.router.navigate(['/menu/vista-producto/product']);
            this.modalC.dismiss("1");
                }
              }
        ]
    });
    await alert.present();
  };

}
