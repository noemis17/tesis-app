import { Component, OnInit } from '@angular/core';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { LoadingController } from '@ionic/angular';
import { NavParams  } from '@ionic/angular';

declare var google;
@Component({
  selector: 'app-mapa',
  templateUrl: './mapa.page.html',
  styleUrls: ['./mapa.page.scss'],
})
export class MapaPage implements OnInit {
  mapRef = null;
  constructor(private geolocation: Geolocation,
    private loadingCtrl: LoadingController, private navParams: NavParams) { }

  ngOnInit() {
    this.loadMap();
  }
  async loadMap() {
    const loading = await this.loadingCtrl.create();
    loading.present();
    const myLatLng = await this.getLocation();
    console.log(myLatLng)
    console.log("sd")
    const mapEle: HTMLElement = document.getElementById('map');
    this.mapRef = new google.maps.Map(mapEle, {
      center: myLatLng,
      zoom: 12
    });
    google.maps.event
    .addListenerOnce(this.mapRef, 'idle', () => {
      loading.dismiss();
      this.addMaker(myLatLng.lat, myLatLng.lng);
      //this.addMaker(parseFloat(this.navParams.data['orden'].latitud),parseFloat(this.navParams.data['orden'].longitud));
    });
    // google.maps.event
    // .addListener(this.mapRef, 'click', (e) => {
    //   loading.dismiss();
    //   this.addMaker(e.latLng.lat(), e.latLng.lng());
    // });
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
  private async getLocation() {
    const rta = await this.geolocation.getCurrentPosition({ enableHighAccuracy: true });
    return {
      lat: rta.coords.latitude,
      lng: rta.coords.longitude
    };
  }
 

}
