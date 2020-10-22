import { Component, OnInit,ViewChild, ElementRef,Injectable } from '@angular/core';
import {DomSanitizer}from '@angular/platform-browser';
import { PerfilService } from 'src/app/Servicios/perfil.service';
import { Camera,CameraOptions} from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import { AlertController,ToastController, ActionSheetController} from '@ionic/angular';
import { ImagePicker, ImagePickerOptions } from '@ionic-native/image-picker/ngx';
import { FileUploadOptions, FileTransfer,FileTransferObject } from '@ionic-native/file-transfer/ngx';
import { TransportistaService } from 'src/app/Servicios/transportista.service';

//Providers
// import { CargarImgProvider }  from '../../providers/cargar-img/cargar-img';
// import { ServiceProvider }  from '../../providers/service/service',
//import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';



@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
@Injectable()
export class PerfilPage implements OnInit {
    nombres: any ;
    cedula: any;
    image:any;
    image1:string;
    celular: any;
    email: any;
    password:any;
    password2:any;
    nome_token_user:any;
    @ViewChild('passwordEyeRegister',{static:false}) passwordEye;
    constructor( private perfilServi:PerfilService, 
      public camera: Camera, 
       public alertController: AlertController,
       public actionController: ActionSheetController,
       public webView: WebView,
       public imagePicker: ImagePicker,
       public toastCtrl: ToastController,

       private transfer: FileTransfer,
       private DomSanitizer: DomSanitizer,
       private transportistaServe: TransportistaService,

      ) { 
   }

  ngOnInit() {
   
    if(localStorage.getItem("cod")=='002'){
      
      setInterval(() => {
        
        navigator.geolocation.getCurrentPosition(position => {
          
          this.transportistaServe.guardarUbicacionTransportista(position.coords.longitude, position.coords.latitude, localStorage.getItem("id"))
          .then((ok) => {
            
           })
           .catch((error) => {
             console.log(error);
            });
          
        });
       
      },60000);
    }
    this.nome_token_user = localStorage.getItem("nomeToken");
    this.nombres = localStorage.getItem("name");
    this.cedula= localStorage.getItem("cedula");
    this.celular= localStorage.getItem("celular");
    this.email= localStorage.getItem("email");
    this.image = this.DomSanitizer.bypassSecurityTrustUrl("https://blooming-plateau-78501.herokuapp.com/"+localStorage.getItem("imagen"));
  }




  @ViewChild('lista' ,{static:false}) lista : ElementRef;
  ocultarPerfil(){
    let listaOcultar = document.getElementById('list');
    listaOcultar.hidden = true;
  }




editar(){
  this.password2=this.password;

 this.perfilServi.modificarperfil(this.nombres,this.email,this.cedula,this.celular,this.nome_token_user)
  .then(data=>{
     console.log(data);
    if(data['code']=='200'){
      this.nombres=data['items']['name'];
      this.email=data['items']['email'];
      this.cedula=data['items']['cedula'];
      this.celular = data['items']['celular'];
  
      
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
editarContrasena(){
  this.password2=this.password;

 this.perfilServi.modificarContrasena(this.password,this.password2,this.nome_token_user)
  .then(data=>{
     console.log(data);
    if(data['code']=='200'){
      this.password=data['items']['password'];
      this.password2=data['items']['password2'];
      this.nome_token_user=localStorage.getItem("nomeToken");

     this.showAlert("Contraseña Modificada");
    }else{
      console.log(data);

    }
  }).catch(err=>{

  }).finally(()=>{

  });


}
async showAlert(Mensaje) {
  const alert = await this.alertController.create({
    message: Mensaje,
    buttons: ['ok']
  });
  await alert.present();
};



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
      this.guardarDocumentoTransaccion(this.image);
    }, (err) => {
      console.log(err);
  });
}

camaraData: any;
AccessGallery(){
  this.camera.getPicture({
    sourceType: this.camera.PictureSourceType.SAVEDPHOTOALBUM,
     destinationType: this.camera.DestinationType.DATA_URL
    }).then((imageData) => {
 
      let base64Image = 'data:image/jpeg;base64,' + imageData;
      this.image = base64Image;
      this.guardarDocumentoTransaccion(this.image);
         }, (err) => {

      console.log(err);

    });

 }
 guardarDocumentoTransaccion(_imagen: string) {
  // debugger
  const fileTransfer: FileTransferObject = this.transfer.create();
//  let params:datos[]=[]; 
  
 // params.push({nombre:'tomas', apellido:'loor'});
  let options: FileUploadOptions = {
    fileKey: 'file',
    fileName: 'perfil.jpg',
    chunkedMode: false,
    httpMethod: 'post',
    mimeType: 'image/jpeg',
    //params : params,
     headers: {}
 }
// var params = {nombre:'tomas', apellido:'loor'};


/*   options.params = {
  Value: JSON.stringify({
    nombre: 'toma',
    apellido: 'loor'
  })
}; */
//  options.params = params;
 //fileTransfer.upload(this.image, 'http://192.168.0.104:8000/upload.php', options)
 fileTransfer.upload(_imagen, 'https://blooming-plateau-78501.herokuapp.com/api/v0/guardarImagenUsuario/'+localStorage.getItem("nomeToken"), options)
  .then((data) => {
    //debugger
    // success
   
  }, (err) => {
    // error
    //  debugger
    alert("error"+JSON.stringify(err));
    console.log("error"+JSON.stringify(err))
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
