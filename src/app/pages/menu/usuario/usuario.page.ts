import { Component, OnInit } from '@angular/core';
import {UsuarioService } from '../../../Servicios/usuario.service';

import { Router } from '@angular/router';
import { Validators, FormBuilder, FormGroup,FormControl} from '@angular/forms';

@Component({
  selector: 'app-usuario',
  templateUrl: './usuario.page.html',
  styleUrls: ['./usuario.page.scss'],
})
export class UsuarioPage implements OnInit {
  public user: FormGroup;
  constructor(
    private usuarioService: UsuarioService,
    private formBuilder: FormBuilder,
    private router:Router,
   ) { 
    this.user = this.formBuilder.group({
      Nombre: ['', Validators.required],
      Cedula: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
      Celular: ['', [Validators.required, Validators.minLength(1), Validators.maxLength(10)]],
      email: ['', Validators.required],
      Contrasena: ['', Validators.compose([Validators.required, Validators.minLength(6), Validators.maxLength(12), Validators.pattern('^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,12}$')])],
      Confirmar: [''],
    });
   

   }
 
  
  ngOnInit() {
  }
 
 registroUsuario(){
    this.usuarioService.guardarUsuario(this.user.controls['Nombre'].value, this.user.controls['email'].value,this.user.controls['Cedula'].value,this.user.controls['Celular'].value,this.user.controls['Contrasena'].value,this.user.controls['Confirmar'].value)
      .then((ok) => {
        if(ok['code']=="200"){
          console.log(ok)
        }else{
          console.log("no se pudo ingresar")
        }
      })
      .catch((error) => {
        console.log(error);
      });
  }
 

}
