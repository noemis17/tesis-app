import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
//import { PostProvider } from '@ionic/angular';
import { RutaService } from '../../Servicios/Rutas/ruta.service';


declare var google;

@Component({
  selector: 'app-ubicacion',
  templateUrl: './ubicacion.page.html',
  styleUrls: ['./ubicacion.page.scss'],
})
export class UbicacionPage implements OnInit {

  mapRef = null;

  constructor(
    private geolocation: Geolocation,
    private loadingCtrl: LoadingController,
    private rutaService: RutaService,
  ) {}

  ngOnInit() {
    this.loadMap();
  }

  UbicacionGuarda()
  {
    this.llamarAPi();
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
      this.addMaker(myLatLng.lat, myLatLng.lng);
    });
    google.maps.event
    .addListener(this.mapRef, 'click', (e) => {
      loading.dismiss();
      this.addMaker(e.latLng.lat(), e.latLng.lng());
    });
  }

  latitud:number=0;
  longitud:number=0;
  listaMarker:any[]=[];
  private addMaker(lat: number, lng: number) {
    console.log("click");
    this.listaMarker.map(item=>{
      item.setMap(null);
    });
    const marker = new google.maps.Marker({
      position: { lat, lng },
      map: this.mapRef,
      title: 'Hello World!'
    });
    this.listaMarker.push(marker);
    this.longitud = lng;
    this.latitud = lat;
  }

  llamarAPi(){
    this.rutaService.guardarUbicacion(
      '2y10kuJotplmz7rJALTZhnVazeLMPXN6PIExs2LTInVRZqGJfDqUQa',
      this.latitud,this.longitud,
      '').then(data=>{
        console.log(data)
      }).catch(error=>{
        console.log(error)
      })
  }

  private async getLocation() {
    const rta = await this.geolocation.getCurrentPosition();
    return {
      lat: rta.coords.latitude,
      lng: rta.coords.longitude
    };
  }

}
