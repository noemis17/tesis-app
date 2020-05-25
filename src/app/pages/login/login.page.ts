import { Component, OnInit,ViewChild } from '@angular/core';
import { LoginService } from '../../Servicios/login.service';
import {Validators, FormBuilder, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
 public todo : FormGroup;
 @ViewChild('passwordEyeRegister',{static:false}) passwordEye;
  constructor(
    private loginService:LoginService,
    private formBuilder: FormBuilder,
    private router:Router
    ) {
      this.todo = this.formBuilder.group({
        Usuario: ['', Validators.required],
        Contrasena: ['',Validators.required],
      });
     }
  login(){
    this.loginService.getlogin(this.todo.controls['Usuario'].value, this.todo.controls['Contrasena'].value)
      .then((ok) => {
        if(ok['items'] == null){
          console.log('error')
        }else{
          this.router.navigateByUrl("menu/producto");
          localStorage.setItem("nomeToken",ok['items'].nome_token)
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
  ngOnInit() {
  }

}
