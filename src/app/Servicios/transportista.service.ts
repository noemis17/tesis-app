import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../environments/environment";
import { resolve } from 'url';

@Injectable({
  providedIn: 'root'
})
export class TransportistaService {

  constructor(private http:HttpClient) { }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
 
  mostrarOrden(id){
    const registro=server+"/v0/FiltroOrdenes?idcourier="+id;
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
