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
    return new Promise((resolve, reject) => {
      this.http.get(server+"/v0/notificaciones_ordenes/"+idusuario,{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });
  }
  desactivarNotificacion(notificaciones){
    const _body = new HttpParams()
      .set("notificaciones",notificaciones)
      ;
    return new Promise((resolve, reject) => {    
      this.http.post(server+"/v0/DesactivarNotificaciones",_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });
  }


}
