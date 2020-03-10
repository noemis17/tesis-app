import { Injectable } from '@angular/core';
import { server } from "../../environments/environment";
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class ProductoService {

  constructor( private http : HttpClient ) { }


  ingresarproducto(){
    
  }

}
