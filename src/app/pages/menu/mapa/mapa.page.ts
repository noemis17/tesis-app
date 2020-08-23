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
import '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions.css' // Updating node module will keep css up to date.

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

declare var google;
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
    this.posicionTransportista();
    //this.addMarker(this.navParams.data['orden'].longitud,this.navParams.data['orden'].latitud,this.navParams.data['orden'].usuarios.name);
    //this.directions.setOrigin([this.navParams.data['orden'].longitud,this.navParams.data['orden'].latitud]);
    navigator.geolocation.getCurrentPosition(position => {
      this.addMarker(position.coords.longitude,position.coords.latitude,localStorage.getItem("name"));
      //this.directions.setDestination([position.coords.longitude, position.coords.latitude]);
    });
    this.setOriginDestino();
    //this.directions.setOrigin(this.navParams.data['orden'].longitud.toString());
    // if (this.navParams.data['identificador'] == 1) {
    //   this.loadMap();
    //   setInterval(() => {
    //     this._resfrescarDatos();
    //   }, 10000);
    // } else {
    //   setInterval(() => {
    //     this.posicionTransportista(this.navParams.data['orden'].idcourier);
    //   }, 10000);
    // }
  }
  ionViewDidEnter() {
    this.posicionTransportista();
  }
  // cargarMapa = true;
  // guardarUbicacionTransportista(longitud, latitud) {
  //   this.transportistaServe.guardarUbicacionTransportista(longitud, latitud, localStorage.getItem("id"))
  //     .then((ok) => {

  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     });

  // }
  // posicionTransportista(idCourier) {
  //   var dato:any=[];
  //   this.transportistaServe.posicionTransportista(idCourier)
  //     .then((ok) => {
  //       dato = ok;
  //       //console.log(ok)
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //     })
  //     .finally(() => {
  //       if (this.cargarMapa == true) {
  //         this.cargarMapa = false;
  //         this.loadMap1(parseFloat(dato['latitud']), parseFloat(dato['longitud']));
  //       }else{
  //         var icon1 = {
  //           url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
  //           scaledSize: new google.maps.Size(25, 25), // scaled size
  //           origin: new google.maps.Point(0, 0), // origin
  //           anchor: new google.maps.Point(0, 0) // anchor
  //         };
  //         this.lugares[1] = { lat: parseFloat(dato['latitud']), lng: parseFloat(dato['longitud']), icon: icon1, nombre:"" };
  //         this.addMaker(parseFloat(dato['longitud']), parseFloat(dato['latitud']));
  //       }
  //     });
  // }
  // async loadMap1(courierLatitud, courierLongitud) {
  //   // console.log(courierLatitud);
  //   // console.log(courierLongitud);
  //   const loading = await this.loadingCtrl.create();
  //   loading.present();
  //   const myLatLng = await this.getLocation();
  //   const mapEle: HTMLElement = document.getElementById('map');
  //   this.mapRef = new google.maps.Map(mapEle, {
  //     center: myLatLng,
  //     zoom: 12
  //   });
  //   google.maps.event
  //     .addListenerOnce(this.mapRef, 'idle', () => {
  //       loading.dismiss();
  //       var icon = {
  //         url: "https://image.flaticon.com/icons/svg/1673/1673221.svg", // url
  //         scaledSize: new google.maps.Size(25, 25), // scaled size
  //         origin: new google.maps.Point(0, 0), // origin
  //         anchor: new google.maps.Point(0, 0) // anchor
  //       };
  //       var icon1 = {
  //         url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
  //         scaledSize: new google.maps.Size(25, 25), // scaled size
  //         origin: new google.maps.Point(0, 0), // origin
  //         anchor: new google.maps.Point(0, 0) // anchor
  //       };
  //       this.lugares = [
  //         {lat:parseFloat(this.navParams.data['orden'].latitud),lng:parseFloat(this.navParams.data['orden'].longitud),icon:icon,nombre:localStorage.getItem("name") },
  //         { lat: courierLatitud, lng: courierLongitud, icon: icon1, nombre: ""}
  //       ];
  //       this.addMaker(myLatLng.lat, myLatLng.lat);
  //       //this.guardarUbicacionTransportista(myLatLng.lat, myLatLng.lat);
  //     });
  // }
  // async _resfrescarDatos() {
  //   const myLatLng = await this.getLocation();
  //   this.guardarUbicacionTransportista(myLatLng.lng, myLatLng.lat);
  //   var icon1 = {
  //     url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
  //     scaledSize: new google.maps.Size(25, 25), // scaled size
  //     origin: new google.maps.Point(0, 0), // origin
  //     anchor: new google.maps.Point(0, 0) // anchor
  //   };
  //   this.lugares[1] = { lat: myLatLng.lat, lng: myLatLng.lng, icon: icon1, nombre: localStorage.getItem("name") };
  //   this.addMaker(myLatLng.lat, myLatLng.lat);
  // }
  // async loadMap() {
  //   const loading = await this.loadingCtrl.create();
  //   loading.present();
  //   const myLatLng = await this.getLocation();
  //   const mapEle: HTMLElement = document.getElementById('map');
  //   this.mapRef = new google.maps.Map(mapEle, {
  //     center: myLatLng,
  //     zoom: 12
  //   });
  //   google.maps.event
  //     .addListenerOnce(this.mapRef, 'idle', () => {
  //       loading.dismiss();
  //       var icon = {
  //         url: "https://image.flaticon.com/icons/svg/1673/1673221.svg", // url
  //         scaledSize: new google.maps.Size(25, 25), // scaled size
  //         origin: new google.maps.Point(0, 0), // origin
  //         anchor: new google.maps.Point(0, 0) // anchor
  //       };
  //       var icon1 = {
  //         url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
  //         scaledSize: new google.maps.Size(25, 25), // scaled size
  //         origin: new google.maps.Point(0, 0), // origin
  //         anchor: new google.maps.Point(0, 0) // anchor
  //       };
  //       this.lugares = [
  //         { lat: parseFloat(this.navParams.data['orden'].latitud), lng: parseFloat(this.navParams.data['orden'].longitud), icon: icon, nombre: "" },
  //         { lat: myLatLng.lat, lng: myLatLng.lng, icon: icon1, nombre: localStorage.getItem("name") }
  //       ];
  //       this.addMaker(myLatLng.lat, myLatLng.lat);
  //       this.guardarUbicacionTransportista(myLatLng.lat, myLatLng.lat);
  //     });
  // }
  // lugares: any[] = [];
  // latitud: number = 0;
  // longitud: number = 0;
  // listaMarker: any[] = [];
  // private addMaker(lat: number, lng: number) {
  //   this.listaMarker.map(item => {
  //     item.setMap(null);
  //   });
  //   this.lugares.map(item => {
  //     console.log(item)
  //     const marker = new google.maps.Marker({
  //       position: { lat: item.lat, lng: item.lng },
  //       map: this.mapRef,
  //       title: 'Hello World!',
  //       icon: item.icon,
  //       label: item.nombre,
  //     });
  //     this.listaMarker.push(marker);
  //   });
  // }
  // private async getLocation() {
  //   const rta = await this.geolocation.getCurrentPosition({ enableHighAccuracy: true });
  //   return {
  //     lat: rta.coords.latitude,
  //     lng: rta.coords.longitude
  //   };
  // }

  async closeModal() {
    await this.modalC.dismiss();
  }
  lat: any;
  lng: any;
  addMarker(longitud,latitud,nombre) {
    var trainStationIcon = document.createElement('div');
    trainStationIcon.style.width = '38px';
    trainStationIcon.style.height = '55px';
    trainStationIcon.style.backgroundImage = "url(https://image.flaticon.com/icons/svg/2850/2850651.svg)";
    trainStationIcon.style.cursor = "pointer";
    var marker = new mapboxgl.Marker()
      // .setLngLat([parseFloat(this.navParams.data['orden'].longitud), parseFloat(this.navParams.data['orden'].latitud)])
      .setLngLat([parseFloat(longitud), parseFloat(latitud)])
      .setPopup(new mapboxgl.Popup({ offset: 25 }) // add popups
      .setHTML('<h3>' +nombre+ '</h3>'))
      .addTo(this.map);
    // this.map.on('load', function() {
    //   this.map.resize();
    // })
    // this.map.addControl(new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl
    // })
    // );
    // this.map.addControl(new mapboxgl.NavigationControl());
    // this.map.addControl(new mapboxgl.FullscreenControl());
    // this.map.addControl(new mapboxgl.GeolocateControl({
    //   positionOptions: {
    //     enableHighAccuracy: true
    //   },
    //   trackUserLocation: true
    // }));
    // this.map.on('mousemove', function(e) {
    //   document.getElementById('coordenadas').innerHTML =
    //     JSON.stringify(e.lngLat);
    // });
  }

  map: any;
  directions:any;
  setOriginDestino(){
    this.directions.setOrigin([this.navParams.data['orden'].longitud,this.navParams.data['orden'].latitud]);
    navigator.geolocation.getCurrentPosition(position => {
      this.addMarker(position.coords.longitude,position.coords.latitude,localStorage.getItem("name"));
      this.directions.setDestination([position.coords.longitude, position.coords.latitude]);
    });
  }
  posicionTransportista() {
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ';
    var latitud = 0;
    var longitud = 0;
    navigator.geolocation.getCurrentPosition(position => {
      latitud = position.coords.latitude;
      longitud = position.coords.longitude;
    });
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v9',
      center:[this.navParams.data['orden'].longitud,this.navParams.data['orden'].latitud],
      zoom: 20,
    });
    // this.map.on('load', function() {
    //   this.map.resize();
    // });
    // this.map.addControl(
    //   new MapboxGeocoder({
    //   accessToken: mapboxgl.accessToken,
    //   mapboxgl: mapboxgl
    //   }),
    // );
    this.directions = new MapboxDirections({
      accessToken: mapboxgl.accessToken,
      unit: 'metric',
      profile: 'mapbox/driving'
    });
    this.map.addControl(this.directions, 'top-left');
    // this.map.addControl(
    //   new MapboxDirections({
    //     accessToken: mapboxgl.accessToken
    //   }), 'top-left');
    this.map.addControl(new mapboxgl.NavigationControl());
    this.map.addControl(new mapboxgl.FullscreenControl());
    this.map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    }));
    // this.map.on('mousemove', function(e) {
    //   document.getElementById('coordenadas').innerHTML =
    //     JSON.stringify(e.lngLat);
    // });
    this.map.on('click', function(e) {
      //this.setOriginDestino();
      this.directions.setOrigin([this.navParams.data['orden'].longitud,this.navParams.data['orden'].latitud]);
      navigator.geolocation.getCurrentPosition(position => {
        this.addMarker(position.coords.longitude,position.coords.latitude,localStorage.getItem("name"));
        this.directions.setDestination([position.coords.longitude, position.coords.latitude]);
      });
      // var coordinates = e.features[0].geometry.coordinates.slice();
      // var description = e.features[0].properties.description;
      //
      // // Ensure that if the map is zoomed out such that multiple
      // // copies of the feature are visible, the popup appears
      // // over the copy being pointed to.
      // while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
      // coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
      // }
      //
      // new mapboxgl.Popup()
      // .setLngLat(coordinates)
      // .setHTML(description)
      // .addTo(map);
    });
    //this.map.dragRotate.disable();
    //this.map.touchZoomRotate.disableRotation();
  }
}
