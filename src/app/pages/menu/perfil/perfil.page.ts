import { Component, OnInit,ViewChild, ElementRef,Injectable } from '@angular/core';

import { PerfilService } from 'src/app/Servicios/perfil.service';
import { Camera,CameraOptions} from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
<<<<<<< HEAD
import { AlertController,ToastController, ActionSheetController} from '@ionic/angular';
import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker/ngx';
//Providers
// import { CargarImgProvider }  from '../../providers/cargar-img/cargar-img';
// import { ServiceProvider }  from '../../providers/service/service';

=======
import { AlertController} from '@ionic/angular';
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78


@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
@Injectable()
export class PerfilPage implements OnInit {
    nombres: any ;
    cedula: any;
    image:string;
    image1:string;
    celular: any;
    email: any;
    password:any;
    password2:any;
    nome_token_user:any;
    @ViewChild('passwordEyeRegister',{static:false}) passwordEye;
<<<<<<< HEAD
    constructor( private perfilServi:PerfilService, 
      public camera: Camera, 
       public alertController: AlertController,
       public actionController: ActionSheetController,
       public webView: WebView,
       public imagePicker: ImagePicker,
       public toastCtrl: ToastController) { 
    
=======
    constructor( private perfilServi:PerfilService,
       private camera: Camera,
       public alertController: AlertController,
       public webView: WebView) {

>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78


   }

  ngOnInit() {

    this.nome_token_user = localStorage.getItem("nomeToken");
    this.nombres = localStorage.getItem("name");
    this.cedula= localStorage.getItem("cedula");
    this.celular= localStorage.getItem("celular");
    this.email= localStorage.getItem("email");
  }




  @ViewChild('lista' ,{static:false}) lista : ElementRef;
  ocultarPerfil(){
    let listaOcultar = document.getElementById('list');
    listaOcultar.hidden = true;
  }




editar(){
  this.password2=this.password;

 this.perfilServi.modificarperfil(this.nombres,this.email,this.cedula,this.celular,this.password,this.password2,this.nome_token_user,this.image)
  .then(data=>{
     console.log(data);
    if(data['code']=='200'){
      this.nombres=data['items']['name'];
      this.email=data['items']['email'];
      this.cedula=data['items']['cedula'];
      this.celular = data['items']['celular'];
      this.password=data['items']['password'];
      this.password2=data['items']['password2'];
      this.nome_token_user=localStorage.getItem("nomeToken");

      console.log("Datos Modificados");
      console.log(data);
    }else{
      console.log(data);

    }
  }).catch(err=>{

  }).finally(()=>{

  });


}


passwordTypeInput  =  'password';
iconpassword  =  'eye-off';
togglePasswordMode() {
  this.passwordTypeInput  =  this.passwordTypeInput  ===  'text'  ?  'password'  :  'text';
  this.iconpassword  =  this.iconpassword  ===  'eye-off'  ?  'eye'  :  'eye-off';
  this.passwordEye.el.setFocus();
}

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
<<<<<<< HEAD
    ]
=======
    ],

>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
  });
  actionsheet.present();
}

<<<<<<< HEAD
=======

// takePicture() {
//   const options: CameraOptions = {
//     quality: 100,
//     destinationType: this.camera.DestinationType.DATA_URL,
//     encodingType: this.camera.EncodingType.JPEG,
//     mediaType: this.camera.MediaType.PICTURE,
//     sourceType: this.camera.PictureSourceType.CAMERA
//   };
//   this.camera.getPicture(options)
//   .then((imageData) => {
//     this.image = 'data:image/jpeg;base64,' + imageData;
//   }, (err) => {
//     console.log(err);
//   });
// }
transfer:any;
>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
takePicture() {
  const options: CameraOptions = {
    quality: 100,
    destinationType: this.camera.DestinationType.FILE_URI,
    encodingType: this.camera.EncodingType.JPEG,
    mediaType: this.camera.MediaType.PICTURE,
    sourceType: this.camera.PictureSourceType.CAMERA
  };
  this.camera.getPicture(options)
  .then((imageData) => {
    this.camaraData=imageData,
   
    this.image = 'data:image/jpeg;base64,' + imageData;
<<<<<<< HEAD
  
=======
    // this.webView.convertFileSrc(imageData);
    const fileTransfer: FileTransferObject = this.transfer.create();
    let options1: FileUploadOptions = {
       fileKey: 'file',
       fileName: 'name.jpg',
       headers: {}
    }
>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
  }, (err) => {
    console.log(err);
  });
}
camaraData: string;
AccessGallery(){
  this.camera.getPicture({
    sourceType: this.camera.PictureSourceType.SAVEDPHOTOALBUM,
     destinationType: this.camera.DestinationType.DATA_URL
<<<<<<< HEAD
    }).then((imageData) => {
    this.camaraData=imageData,
=======

    }).then((imageData) => {

>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
      this.image= 'data:image/jpeg;base64,'+imageData;

         }, (err) => {

      console.log(err);

    });

 }


// mostrar_mensaje(msj){
//   let toast = this.toastCtrl.create({
//       message: msj,
//       duration: 3000,
//       // position: 'buttom'
//   });
//   toast.present();
//   }
}
