import { Component, OnInit,ViewChild, ElementRef } from '@angular/core';
// import {Validators, FormBuilder, FormGroup, FormControl } from '@angular/forms';
// import { NavController, NavParams } from '@ionic/angular';
// import {EditarPerilPage } from '../editar-peril/editar-peril.page';
import { PerfilService } from 'src/app/Servicios/perfil.service';
import { Camera,CameraOptions} from '@ionic-native/camera/ngx';
import { AlertController} from '@ionic/angular';



@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
export class PerfilPage implements OnInit {
    nombres: any ;
    cedula: any;
    image:string;
    celular: any;
    email: any;
    password:any;
    password2:any;
    nome_token_user:any;
    @ViewChild('passwordEyeRegister',{static:false}) passwordEye;
    constructor( private perfilServi:PerfilService, 
       private camera: Camera, 
       public alertController: AlertController) { 
    


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
  debugger
 this.perfilServi.modificarperfil(this.nombres,this.email,this.cedula,this.celular,this.password,this.password2,this.nome_token_user)
  .then(data=>{
    if(data['code']=='200'){
      this.nombres=data['items']['name'];
      this.email=data['items']['email'];
      this.cedula=data['items']['cedula'];
      this.celular = data['items']['celular'];
      this.password=data['items']['password'];
      this.password2=data['items']['password2'];
      this.nome_token_user=localStorage.getItem("nomeToken");
      console.log("datosmodificados");
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
}
