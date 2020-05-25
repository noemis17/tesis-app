import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class UsuarioService {

  constructor(private http:HttpClient) { }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
  
  guardarUsuario(name,email,cedula,celular,password,password2){
    const _body = new HttpParams()
     
      .set("name",name)
      .set("email",email)
      .set("cedula",cedula)
      .set("celular",celular)
      .set("password",password)
      .set("password2",password2)
    ;
    //return this.http.post(server+"/v0/ubicacion_store/"+token,_body.toString(),{headers:this._header});
    return new Promise((resolve, reject) => {
      this.http.post(server+"/v0/register/",_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });



  }
}
