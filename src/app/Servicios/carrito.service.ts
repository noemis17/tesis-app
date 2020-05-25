import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";


@Injectable({
  providedIn: 'root'
})
export class CarritoService {
  constructor(private http:HttpClient) { }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
  agregarCarrito(nome_token_user){
    const _body = new HttpParams();
    return new Promise((resolve, reject) => {
      this.http.put(server+"/v0/ventas_generar_pedido/"+nome_token_user,{headers:this._header,params:_body})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });
  }
}
