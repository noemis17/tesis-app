import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController,NavParams,  ModalController} from '@ionic/angular';
import * as  mapboxgl  from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
import { RutaService, Feature } from '../../../Servicios/Rutas/ruta.service';
import * as MapboxDraw from '@mapbox/mapbox-gl-draw';



@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {




  constructor(
    private navParams: NavParams,
    private modalC: ModalController,
   ) {

  }
  posicion_: any[] = [];
  dataPosicionCenter: any;
  ngOnInit() {
    this.dataPosicionCenter = this.navParams.data['position'];
    if (localStorage.getItem("ubicacion")==null) {
      localStorage.setItem("ubicacion",JSON.stringify(this._marker));
    }
    this.posicion();
  }
  latitud = 0;
  longitud = 0;
  _marker:any;
  map: any;
  addMarker(longitud, latitud, nombre) {
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
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [this.navParams.data['position'].coords.longitude, this.navParams.data['position'].coords.latitude],
      zoom: 15,
    });
    // this.map.addControl(
    //   new MapboxGeocoder({
    //     accessToken: mapboxgl.accessToken,
    //     mapboxgl: mapboxgl
    //   })
    // );

    this.map.addControl(new mapboxgl.NavigationControl());
    this.map.addControl(new mapboxgl.FullscreenControl());
    const geolocate = new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    })
    this.map.addControl(geolocate)
    // this.map.addControl(new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //     enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    // }));

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
    var _map:any;
    _map = this.map;
    geolocate.on('geolocate', function()
    {
      var userlocation = geolocate._lastKnownPosition;
      console.log(userlocation);
      // if (localStorage.getItem("ubicacion")!="undefined") {
      //   if (this._marker!= undefined) {
      //     this._marker.setLngLat([userlocation.coords.longitude, userlocation.coords.latitude]);
      //   }else{
      //     this._marker = new mapboxgl.Marker()
      //       .setLngLat([userlocation.coords.longitude, userlocation.coords.latitude])
      //       .addTo(_map)
      //   }
      // }
      // var posicionActual = {"lng":userlocation.coords.longitude,"lat":userlocation.coords.latitude};
      // localStorage.setItem("ubicacion",JSON.stringify(posicionActual));
    });
  }

  async closeModal() {
    await this.modalC.dismiss();
  }

}
