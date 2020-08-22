import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import * as  mapboxgl  from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { RutaService, Feature } from '../../../Servicios/Rutas/ruta.service';




@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {



lat=-80.244266;
lng=-0.929941;
  constructor( ) {
    
  }

  ngOnInit() {
    this.builMap(); 
  }

 builMap(){
  mapboxgl.accessToken = 'pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ';
   var map= new mapboxgl.Map({
     container:'map',
     style:'mapbox://styles/mapbox/streets-v11',
     center:[this.lat,this.lng],
     zoom:9
     });
     
  var marker = new mapboxgl.Marker()
  .setLngLat([this.lat,this.lng])
  .addTo(map);
  map.addControl(
    new MapboxGeocoder({
    accessToken: mapboxgl.accessToken,
    mapboxgl: mapboxgl
    })
    );
    
    }
    
  
}
