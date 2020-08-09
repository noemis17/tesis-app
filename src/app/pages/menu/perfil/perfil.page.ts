import { Component, OnInit,ViewChild, ElementRef } from '@angular/core';
// import {Validators, FormBuilder, FormGroup, FormControl } from '@angular/forms';
// import { NavController, NavParams } from '@ionic/angular';
// import {EditarPerilPage } from '../editar-peril/editar-peril.page';
import { PerfilService } from 'src/app/Servicios/perfil.service';



@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
})
export class PerfilPage implements OnInit {
    nombres: any ;
    cedula: any;
    celular: any;
    email: any;
    password:any;
    password2:any;
    nome_token_user:any;
    constructor( private perfilServi:PerfilService) { 
    


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



}
