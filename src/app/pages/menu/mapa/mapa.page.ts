import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import { NavParams,ModalController } from '@ionic/angular';
import { TransportistaService } from '../../../Servicios/transportista.service'
import * as  mapboxgl  from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
import  MapboxDirections from 'mapbox-gl-directions';
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
    private loadingCtrl: LoadingController, private navParams: NavParams, private transportistaServe: TransportistaService, private modalC:ModalController,) {
  }

  ngOnInit() {
    this.posicionTransportista(); 

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

  async closeModal(){
    await this.modalC.dismiss();
  }
  lat=-80.244266;
lng=-0.929941;

posicionTransportista(){
    mapboxgl.accessToken = 'pk.eyJ1Ijoibm9lbWkxNyIsImEiOiJja2U0eDlmbXUweGVlMnptdzhyMmhxY3NqIn0.pdK5JCeAlWgpAXIfQIKovQ';
     var map= new mapboxgl.Map({
       container:'map',
       style:'mapbox://styles/mapbox/streets-v11',
       center:[this.lat,this.lng],
       zoom:9
       });
       
    // var marker = new mapboxgl.Marker()
    // .setLngLat([this.lat,this.lng])
    // .addTo(map);
  
      map.on('load', function(){
        map.resize();
      })
      map.addControl( new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
        })
        );
      map.addControl(new mapboxgl.NavigationControl());
      map.addControl(new mapboxgl.FullscreenControl());
      map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
            enableHighAccuracy: true
        },
        trackUserLocation: true
      }));
      map.on('mousemove', function (e) {
        document.getElementById('coordenadas').innerHTML =
            JSON.stringify(e.lngLat);
         
      });
     
      console.log(map);
  //  map.addControl(
  //   new MapboxDirections({
  //   accessToken: mapboxgl.accessToken
  //  }),
  //  'top-left'
  //  ); 
      
      }

}
