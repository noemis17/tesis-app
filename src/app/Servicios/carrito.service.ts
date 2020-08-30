import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";
import { resolve } from 'url';


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


 
  guardarCompra(idPromocionProducto,idUsuario,producto,idTipoPago,total,latitud,longitud){
    const _body = new HttpParams()
      .set("idPromociones",idPromocionProducto)
      .set("idUsuario",idUsuario)
      .set("productos",producto)
      .set("idTipoPago",idTipoPago)
      .set("total",total)
      .set("latitud",latitud)
      .set("longitud",longitud)
      ;
    return new Promise((resolve, reject) => {
      // this.http.post(server+"/v0/ComprarProducto/",_body.toString(),{headers:this._header})
      this.http.post(server+"/v0/ComprarProducto/",_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });
  }
  ConsultarOrdenesCompradas(idUsuario){
    const _body = new HttpParams()
      .set("idUsuario",idUsuario)
      ;
      // this.http.post(server+"/v0/OrdenesCompradas/",_body.toString(),{headers:this._header})
    return new Promise((resolve, reject) => {
      this.http.post(server+"/v0/OrdenesCompradas/",_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });

  }

  


  guardarDocumentoTransaccion(imagen:string){
    const _body = new HttpParams()
    .set("file_producto_img",imagen)
    ;

    return new Promise((resolve,reject)=>{ this.http.post(server+'/v0/guardarDocumentoTransaccion',_body.toString(),{headers:this._header})
                    .subscribe(res=>{
                      resolve(res);
                    },(err)=>{
                      reject(err);
                    });
                });
  }


}


