import { Component, OnInit,ViewChild, ElementRef } from '@angular/core';
import { LoginService } from '../../Servicios/login.service';
import {Validators, FormBuilder, FormGroup, FormControl } from '@angular/forms';
import { Router } from '@angular/router';
import {UsuarioService } from '../../Servicios/usuario.service';
import { AlertController,LoadingController,ToastController, IonInput } from '@ionic/angular';
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
    private router:Router,
    private toastController: ToastController,
    ) {
      this.todo = this.formBuilder.group({
        Usuario: ['', Validators.required],
        Contrasena: ['',Validators.required],
        cedula: new FormControl({value:"",disabled:false},[Validators.maxLength(10),Validators.pattern('^[0-9]+$')])
      });
      this.user = this.formBuilder.group({
        Nombre: ['', Validators.required],
        // Cedula: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
        // Celular: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(10)]],
        email: ['', Validators.required],
        Contrasena: ['', [Validators.required, Validators.minLength(6), Validators.maxLength(12)]],
        Confirmar: [''],
        cedula: new FormControl({value:"",disabled:false},[Validators.maxLength(10),Validators.pattern('^[0-9]+$')]),
        celular:new FormControl({value:"",disabled:false},[Validators.maxLength(10),Validators.pattern('^[0-9]+$')]),
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
          this.presentToast("El usuario o la contraceña son incorrectos",3000);
        }else{
          this.router.navigateByUrl("menu/vista-producto");
          localStorage.setItem("nomeToken",ok['items'].nome_token);
          localStorage.setItem("id",ok['items'].id);
          localStorage.setItem("name",ok['items'].name);
          localStorage.setItem("email",ok['items'].email);
          localStorage.setItem("cedula",ok['items'].cedula);
          localStorage.setItem("celular",ok['items'].celular);
          var setDato:any[]=[];
          var setUbicacion:any;
          localStorage.setItem("carrito",JSON.stringify(setDato));
          localStorage.setItem("carritoPromociones",JSON.stringify(setDato));
          localStorage.setItem("ubicacion",JSON.stringify(setUbicacion));
        }
        console.log(ok);
      })
      .catch((error) => {
        console.log(error);
      });


  }

  async presentToast(_mensaje:string,_duracion:number) {
    const toast = await this.toastController.create({
      message: _mensaje,
      duration: _duracion,
      buttons: [
        {
          text: 'Cerrar',
          role: 'cancel',
          handler: () => {
            console.log('Cancel clicked');
          }
        }
      ],
    });
    toast.present();
  }

  passwordTypeInput  =  'password';
  iconpassword  =  'eye-off';
  togglePasswordMode() {
    this.passwordTypeInput  =  this.passwordTypeInput  ===  'text'  ?  'password'  :  'text';
    this.iconpassword  =  this.iconpassword  ===  'eye-off'  ?  'eye'  :  'eye-off';
    this.passwordEye.el.setFocus();
  }

 registroUsuario(){
  this.usuarioService.guardarUsuario(this.user.controls['Nombre'].value, this.user.controls['email'].value,this.user.controls['cedula'].value,this.user.controls['celular'].value,this.user.controls['Contrasena'].value,this.user.controls['Confirmar'].value)
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
  }
  
}
