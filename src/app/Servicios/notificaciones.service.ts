import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";
@Injectable({
  providedIn: 'root'
})
export class NotificacionesService {

  constructor(private http:HttpClient) { }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');

  getNotificaciones(idusuario){
    const _body = new HttpParams()
    .set("idUsuario",idusuario)
    ;
    return new Promise((resolve, reject) => {
      this.http.get(server+"/v0/notificaciones_ordenes",{headers:this._header,params:_body})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });


  }


}
