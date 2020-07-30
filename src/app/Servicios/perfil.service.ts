import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class PerfilService {

  constructor(private http:HttpClient) { }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
  modificarperfil(name,email,cedula,celular,password,password2,nome_token_user){
    const _body = new HttpParams()
    .set("nome_token",nome_token_user)
    .set("name",name)
    .set("email",email)
    .set("cedula",cedula)
    .set("celular",celular)
    .set("password",password)
    .set("password2",password2)
  ;
    return new Promise((resolve, reject) => {
      this.http.put(server+"/v0/usuarios_update/"+nome_token_user,_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });
  }
  mostrarPerfil(id:string){
    const registro=server+"/v0/usuarios_filtro"+id;
         return new Promise((resolve, reject) => {
           this.http.get(registro,
           {headers:new HttpHeaders().set('Content-Type','application/json')})
                     .subscribe(res=>{
                       resolve(res);
                     },(err)=>{
                       reject(err);
                     });
         });
  }
 
}
