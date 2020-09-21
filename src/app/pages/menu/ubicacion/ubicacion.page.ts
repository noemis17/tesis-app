import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController,NavParams,  ModalController} from '@ionic/angular';
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




  constructor(
    private navParams: NavParams,
    private modalC: ModalController,
    private geolocation: Geolocation
   ) {
    
  }
  posicion_: any[] = [];
  //dataPosicionCenter: any;
  ngOnInit() {
    //this.dataPosicionCenter = this.navParams.data['position'];
    if (localStorage.getItem("ubicacion")==null) {
      localStorage.setItem("ubicacion",JSON.stringify(this._marker));
    }
    this.posicion();
  
  }
  latitud = 0;
  longitud = 0;
  _marker:any;
  map: any;
  addMarker(longitud:number, latitud:number, nombre) {
    this._marker = new mapboxgl.Marker()
      .setLngLat([longitud, latitud])
      .setHTML('<h3>' + longitud, latitud + '</h3>')
      .addTo(this.map);
      // this._marker = marker;
  }
  obtenerlocalizacion() {
    var posicionamiento: any[] = [];
    navigator.geolocation.getCurrentPosition(position => {
      this.posicion_.push(position.coords.latitude);
      this.posicion_.push(position.coords.longitude);
    });
  }
  posicion() {
    
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ';
    var pos_Latitud;
    var pos_Longitud;
    this.geolocation.getCurrentPosition().then((resp) => {
        console.log(resp)
        pos_Latitud = resp.coords.latitude;
        pos_Longitud = resp.coords.longitude;
        this.map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v11',
          center: [pos_Longitud, pos_Latitud],
          zoom: 13,
        });
        this.map.addControl(new MapboxGeocoder({
            accessToken: mapboxgl.accessToken,
            mapboxgl: mapboxgl
          })
        );
        
        this.map.addControl(new mapboxgl.NavigationControl());
        this.map.addControl(new mapboxgl.FullscreenControl());
        // this.map.addControl(new mapboxgl.GeolocateControl({
        //   positionOptions: {
        //     enableHighAccuracy: true
        //   },
        //   trackUserLocation: true
        // }));
    
        // this.map.on('mousemove', function (e) {
        //   document.getElementById('coordenadas').innerHTML =
        // JSON.stringify(e.lngLat);
        //  });
      
        // this.map.addControl(new MapboxGeocoder({
        //   accessToken: mapboxgl.accessToken
        //  }));


        
        this.map.on('click', function(e) {
          if (localStorage.getItem("ubicacion")!="undefined") {
            if (this._marker!= undefined) {
              this._marker.setLngLat([e.lngLat.lng, e.lngLat.lat]);
            }else{
              this._marker = new mapboxgl.Marker()
                .setLngLat([e.lngLat.lng,e.lngLat.lat])
                .addTo(this)
            }
          }
          this.resize();
          localStorage.setItem("ubicacion",JSON.stringify(e.lngLat));
        });
        this.map.on('load', function(e) {
          if (localStorage.getItem("ubicacion")!="undefined") {
            this._marker = new mapboxgl.Marker()
              .setLngLat([JSON.parse(localStorage.getItem("ubicacion"))['lng'],JSON.parse(localStorage.getItem("ubicacion"))['lat']])
              .addTo(this)
              this.resize();
          }
        });
       }).catch((error) => {
         console.log('Error getting location', error);
      });
  }

  async closeModal() {
    await this.modalC.dismiss();
  }    
  
}
