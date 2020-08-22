import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams} from '@angular/common/http';
import { server } from "../../../environments/environment";
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';

export interface MapboxOutput {
  attribution: string;
  features: Feature[];
  query: [];
}

export interface Feature {
  place_name: string;
}
@Injectable({
  providedIn: 'root'
})



export class RutaService {
  
  constructor(private http:HttpClient) { }
  

  search_word(query: string) {
    const url = 'https://api.mapbox.com/geocoding/v5/mapbox.places/';
    return this.http.get(url + query + '.json?types=address&access_token='
    + environment.mapbox.accessToken)
    .pipe(map((res: MapboxOutput) => {
      return res.features;
    }));
    
  }
  private _header = new HttpHeaders().set('Content-Type', 'application/x-www-form-urlencoded');
  guardarUbicacion(token,latitud,longitud,descripcion){
    const _body = new HttpParams()
      .set("latitud",latitud)
      .set("nome_token",token)
      .set("longitud",longitud)
      .set("descripcion",descripcion)
    ;
    //return this.http.post(server+"/v0/ubicacion_store/"+token,_body.toString(),{headers:this._header});
    return new Promise((resolve, reject) => {
      this.http.post(server+"/v0/ubicacion_store/"+token,_body.toString(),{headers:this._header})
                .subscribe(res=>{
                  resolve(res);
                },(err)=>{
                  reject(err);
                });
    });



  }


}
