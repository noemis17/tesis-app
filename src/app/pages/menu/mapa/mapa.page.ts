import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import { NavParams, ModalController } from '@ionic/angular';
import { TransportistaService } from '../../../Servicios/transportista.service'
import * as  mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// import MapboxDirections from 'mapbox-gl-directions';
import MapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions'
import 'mapbox-gl/dist/mapbox-gl.css' // Updating node module will keep css up to date.
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css' // Updating node module will keep css up to date
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.page.html',
  styleUrls: ['./mapa.page.scss'],
})
export class MapaPage implements OnInit {
  mapRef: any;
  constructor(private geolocation: Geolocation,
    private loadingCtrl: LoadingController, private navParams: NavParams, private transportistaServe: TransportistaService, private modalC: ModalController, ) {
  }

  
  ngOnInit() {
    this.cargarMapa();
    if (this.navParams.data.identificador != 2) {
      this.addMarker(this.navParams.data['orden'].longitud, this.navParams.data['orden'].latitud, this.navParams.data['orden'].usuarios.name);
      this.directions.setOrigin([this.navParams.data['orden'].longitud, this.navParams.data['orden'].latitud]);
      navigator.geolocation.getCurrentPosition(position => {
        this.addMarker(position.coords.longitude, position.coords.latitude, localStorage.getItem("name"));
        this.directions.setDestination([position.coords.longitude, position.coords.latitude]);
      });
      setInterval(() => {
        navigator.geolocation.getCurrentPosition(position => {
          this.lugar[1].setLngLat([position.coords.longitude, position.coords.latitude]);
          this.directions.setDestination([position.coords.longitude, position.coords.latitude]);
          this.guardarUbicacionTransportista(position.coords.longitude, position.coords.latitude);
        });
      },60000);
    } else {
      this.cargarMapa();
      navigator.geolocation.getCurrentPosition(position => {
        this.addMarker(this.navParams.data['orden'].longitud, this.navParams.data['orden'].latitud, this.navParams.data['orden'].usuarios.name);
        this.directions.setDestination([this.navParams.data['orden'].longitud, this.navParams.data['orden'].latitud]);
      });
      setInterval(() => {
        this.posicionTransportista(this.navParams.data['orden'].idcourier);
        console.log("acutalizando transportista")
      }, 60000);
    }
  }
  lugar: any[] = [];
  posicionTransportista(idCourier) {
    this.transportistaServe.posicionTransportista(idCourier)
      .then((ok) => {
        this.addMarker(ok['longitud'], ok['latitud'],ok['usuarios'].name);
        this.directions.setOrigin([ok['longitud'], ok['latitud']]);
      })
      .catch((error) => {
        console.log(error);
      });
  }
  guardarUbicacionTransportista(longitud, latitud) {
    this.transportistaServe.guardarUbicacionTransportista(longitud, latitud, localStorage.getItem("id"))
      .then((ok) => {
      })
      .catch((error) => {
        console.log(error);
      });
  }
  async closeModal() {
    await this.modalC.dismiss();
  }
  lat: any;
  lng: any;
  addMarker(longitud, latitud, nombre) {
    var trainStationIcon = document.createElement('div');
    trainStationIcon.style.width = '38px';
    trainStationIcon.style.height = '55px';
    trainStationIcon.style.backgroundImage = "url(https://image.flaticon.com/icons/svg/2850/2850651.svg)";
    trainStationIcon.style.cursor = "pointer";
    var marker = new mapboxgl.Marker()
      .setLngLat([parseFloat(longitud), parseFloat(latitud)])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
        .setHTML('<h3>' + nombre + '</h3>'))
      .addTo(this.map);
    this.lugar.push(marker);
    this.map.resize();
  }

  
  map: any;
  directions: any;
  cargarMapa() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ';
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center: [this.navParams.data['orden'].longitud, this.navParams.data['orden'].latitud],
      zoom: 14,
    });
    
    this.directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric',
      profile: 'mapbox/driving',
      alternatives: false,
      steps: false,
      compile: function(c) {
        // console.log(c)
      },
      controls: {
        profileSwitcher: false,
        instructions: false
      },
      geocoder: {
        language: "es"
      },
    });
    this.map.addControl(this.directions, 'bottom-left');
    this.map.addControl(new mapboxgl.NavigationControl());
    this.map.addControl(new mapboxgl.FullscreenControl());
    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    }));
  }
}
