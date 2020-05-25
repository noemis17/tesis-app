
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { server } from "../../environments/environment";

@Injectable({
  providedIn: 'root'
})
export class PromocionesService {

  
  constructor(private http:HttpClient) { }
   private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
  // mostrarProducto(nome_token_user){
  // const _body = new HttpParams();
  //   return new Promise((resolve, reject) => {
  //     this.http.get(server+"/v0/productos_filtro/"+nome_token_user,{headers:this._header,params:_body})
  //               .subscribe(res=>{
  //                 resolve(res);
  //               },(err)=>{
  //                 reject(err);
  //               });
  //   });
  // }
}
