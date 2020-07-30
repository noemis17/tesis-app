import { Component, OnInit,ViewChild, ElementRef } from '@angular/core';
import { LoginService } from '../../Servicios/login.service';
import {Validators, FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import {UsuarioService } from '../../Servicios/usuario.service';
import { AlertController, IonInput } from '@ionic/angular';
import { Camera,CameraOptions} from '@ionic-native/camera/ngx';
@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
  signupView: boolean = false
 public todo : FormGroup;
 public user: FormGroup;
 @ViewChild('passwordEyeRegister',{static:false}) passwordEye;
  constructor(
    private usuarioService: UsuarioService,
    private loginService:LoginService,
    private formBuilder: FormBuilder,
    public alertController: AlertController,
    private router:Router, private camera: Camera
    ) {
      this.todo = this.formBuilder.group({
        Usuario: ['', Validators.required],
        Contrasena: ['',Validators.required], 
        cedula: new FormControl({value:"",disabled:false},[Validators.maxLength(10),Validators.pattern('^[0-9]+$')])
      });
      this.user = this.formBuilder.group({
        Nombre: ['', Validators.required],
        Cedula: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
        Celular: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
        email: ['', Validators.required],
        Contrasena: ['', [Validators.required, Validators.minLength(6), Validators.maxLength(12)]],
        Confirmar: [''], 
      });
    
     }
     image:string;

     //@ViewChild('cedula',{static:false}) cedula: ElementRef;

     toggleSignUpView () {
      this.signupView = !this.signupView
    }
  login(){
    this.loginService.getlogin(this.todo.controls['Usuario'].value, this.todo.controls['Contrasena'].value)
      .then((ok) => {
      
        if(ok['items'] == null){
          console.log('error')
        }else{
          this.router.navigateByUrl("menu/vista-producto");
          localStorage.setItem("nomeToken",ok['items'].nome_token)
          var setDato:any[]=[];
          localStorage.setItem("carrito",JSON.stringify(setDato));
          localStorage.setItem("carritoPromociones",JSON.stringify(setDato));
        }
      })
      .catch((error) => {
        console.log(error);
      });
     
  }
  passwordTypeInput  =  'password';
  iconpassword  =  'eye-off';
  togglePasswordMode() {
    this.passwordTypeInput  =  this.passwordTypeInput  ===  'text'  ?  'password'  :  'text';
    this.iconpassword  =  this.iconpassword  ===  'eye-off'  ?  'eye'  :  'eye-off';
    this.passwordEye.el.setFocus();
  }
   
 registroUsuario(){
  this.usuarioService.guardarUsuario(this.user.controls['Nombre'].value, this.user.controls['email'].value,this.user.controls['Cedula'].value,this.user.controls['Celular'].value,this.user.controls['Contrasena'].value,this.user.controls['Confirmar'].value)
    .then((ok) => {
      if(ok['code']=="200"){
        this.showAlert("Datos Registrado")
      }else{
        this.showAlert("No se pueden guardar datos")
      }
    })
    .catch((error) => {
      console.log(error);
    });
  }

  async showAlert (Mensaje) {
    const alert = await this.alertController.create({
      message: Mensaje,
      buttons: ['ok']
    });
    await alert.present();
  };
  ngOnInit() {
  
    // this.user.reset();
    
  }
 

  async presentAlertPrompt() {
    const alert = await this.alertController.create({
      cssClass: 'my-custom-class',
      header: 'Comprobante',
      inputs: [
        {
          name: 'radio1',
          type: 'radio',
          label: 'Camara',
          value: 'value1',
          checked: true,
          // handler:()=>{
          //   console.log('hoohohoh');
          //   this.takePicture();
          // }
        },
        {
          name: 'radio2',
          type: 'radio',
          label: 'galeria',
          value: 'value2',
          // handler:()=>{
          //   console.log('hoohohoh');
          //   this.AccessGallery();
          // }
        }
      ],
      mode:"ios",
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
          handler: (data) => {
            console.log('Confirm Ok');
            if (data==='value1') {
              this.takePicture();
            } else if(data==='value2') {
              this.AccessGallery();
            }
            // let listaTPagosPorId = document.getElementById('listaTPagos');
            // listaTPagosPorId.hidden = true;
            
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


}
