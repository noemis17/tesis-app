import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import { NavParams } from '@ionic/angular';
import { TransportistaService } from '../../../Servicios/transportista.service'

declare var google;
@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.page.html',
  styleUrls: ['./mapa.page.scss'],
})
export class MapaPage implements OnInit {
  mapRef: any;
  constructor(private geolocation: Geolocation,
    private loadingCtrl: LoadingController, private navParams: NavParams, private transportistaServe: TransportistaService) {
  }

  ngOnInit() {
    if (this.navParams.data['identificador'] == 1) {
      this.loadMap();
      setInterval(() => {
        this._resfrescarDatos();
      }, 1000);
    } else {
      setInterval(() => {
        this.posicionTransportista(this.navParams.data['orden'].idcourier);
      }, 1000);
    }
  }
  cargarMapa = true;
  guardarUbicacionTransportista(longitud, latitud) {
    this.transportistaServe.guardarUbicacionTransportista(longitud, latitud, localStorage.getItem("id"))
      .then((ok) => {

      })
      .catch((error) => {
        console.log(error);
      });

  }
  posicionTransportista(idCourier) {
    var dato:any=[];
    this.transportistaServe.posicionTransportista(idCourier)
      .then((ok) => {
        dato = ok;
        //console.log(ok)
      })
      .catch((error) => {
        console.log(error);
      })
      .finally(() => {
        if (this.cargarMapa == true) {
          this.cargarMapa = false;
          this.loadMap1(parseFloat(dato['latitud']), parseFloat(dato['longitud']));
        }else{
          var icon1 = {
            url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
            scaledSize: new google.maps.Size(25, 25), // scaled size
            origin: new google.maps.Point(0, 0), // origin
            anchor: new google.maps.Point(0, 0) // anchor
          };
          this.lugares[1] = { lat: parseFloat(dato['latitud']), lng: parseFloat(dato['longitud']), icon: icon1, nombre:"" };
          this.addMaker(parseFloat(dato['longitud']), parseFloat(dato['latitud']));
        }
      });
  }
  async loadMap1(courierLatitud, courierLongitud) {
    // console.log(courierLatitud);
    // console.log(courierLongitud);
    const loading = await this.loadingCtrl.create();
    loading.present();
    const myLatLng = await this.getLocation();
    const mapEle: HTMLElement = document.getElementById('map');
    this.mapRef = new google.maps.Map(mapEle, {
      center: myLatLng,
      zoom: 12
    });
    google.maps.event
      .addListenerOnce(this.mapRef, 'idle', () => {
        loading.dismiss();
        var icon = {
          url: "https://image.flaticon.com/icons/svg/1673/1673221.svg", // url
          scaledSize: new google.maps.Size(25, 25), // scaled size
          origin: new google.maps.Point(0, 0), // origin
          anchor: new google.maps.Point(0, 0) // anchor
        };
        var icon1 = {
          url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
          scaledSize: new google.maps.Size(25, 25), // scaled size
          origin: new google.maps.Point(0, 0), // origin
          anchor: new google.maps.Point(0, 0) // anchor
        };
        this.lugares = [
          {lat:parseFloat(this.navParams.data['orden'].latitud),lng:parseFloat(this.navParams.data['orden'].longitud),icon:icon,nombre:localStorage.getItem("name") },
          { lat: courierLatitud, lng: courierLongitud, icon: icon1, nombre: ""}
        ];
        this.addMaker(myLatLng.lat, myLatLng.lat);
        //this.guardarUbicacionTransportista(myLatLng.lat, myLatLng.lat);
      });
  }
  async _resfrescarDatos() {
    const myLatLng = await this.getLocation();
    this.guardarUbicacionTransportista(myLatLng.lng, myLatLng.lat);
    var icon1 = {
      url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
      scaledSize: new google.maps.Size(25, 25), // scaled size
      origin: new google.maps.Point(0, 0), // origin
      anchor: new google.maps.Point(0, 0) // anchor
    };
    this.lugares[1] = { lat: myLatLng.lat, lng: myLatLng.lng, icon: icon1, nombre: localStorage.getItem("name") };
    this.addMaker(myLatLng.lat, myLatLng.lat);
  }
  async loadMap() {
    const loading = await this.loadingCtrl.create();
    loading.present();
    const myLatLng = await this.getLocation();
    const mapEle: HTMLElement = document.getElementById('map');
    this.mapRef = new google.maps.Map(mapEle, {
      center: myLatLng,
      zoom: 12
    });
    google.maps.event
      .addListenerOnce(this.mapRef, 'idle', () => {
        loading.dismiss();
        var icon = {
          url: "https://image.flaticon.com/icons/svg/1673/1673221.svg", // url
          scaledSize: new google.maps.Size(25, 25), // scaled size
          origin: new google.maps.Point(0, 0), // origin
          anchor: new google.maps.Point(0, 0) // anchor
        };
        var icon1 = {
          url: "https://image.flaticon.com/icons/svg/2850/2850651.svg", // url
          scaledSize: new google.maps.Size(25, 25), // scaled size
          origin: new google.maps.Point(0, 0), // origin
          anchor: new google.maps.Point(0, 0) // anchor
        };
        this.lugares = [
          { lat: parseFloat(this.navParams.data['orden'].latitud), lng: parseFloat(this.navParams.data['orden'].longitud), icon: icon, nombre: "" },
          { lat: myLatLng.lat, lng: myLatLng.lng, icon: icon1, nombre: localStorage.getItem("name") }
        ];
        this.addMaker(myLatLng.lat, myLatLng.lat);
        this.guardarUbicacionTransportista(myLatLng.lat, myLatLng.lat);
      });
  }
  lugares: any[] = [];
  latitud: number = 0;
  longitud: number = 0;
  listaMarker: any[] = [];
  private addMaker(lat: number, lng: number) {
    this.listaMarker.map(item => {
      item.setMap(null);
    });
    this.lugares.map(item => {
      console.log(item)
      const marker = new google.maps.Marker({
        position: { lat: item.lat, lng: item.lng },
        map: this.mapRef,
        title: 'Hello World!',
        icon: item.icon,
        label: item.nombre,
      });
      this.listaMarker.push(marker);
    });
  }
  private async getLocation() {
    const rta = await this.geolocation.getCurrentPosition({ enableHighAccuracy: true });
    return {
      lat: rta.coords.latitude,
      lng: rta.coords.longitude
    };
  }


}
