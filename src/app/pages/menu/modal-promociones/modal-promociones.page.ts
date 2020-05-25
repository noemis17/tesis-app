import { Component, OnInit,Input } from '@angular/core';
import { ModalController,NavParams  } from '@ionic/angular';


@Component({
  selector: 'app-modal-promociones',
  templateUrl: './modal-promociones.page.html',
  styleUrls: ['./modal-promociones.page.scss'],
})
export class ModalPromocionesPage implements OnInit {
  constructor(
    private modalC:ModalController,
    private navParams: NavParams
    ) { }
    listaPromociones:any[]=[];
  ngOnInit() {
    this.listaPromociones=[];
    this.listaPromociones=this.navParams.data['Promociones'];
    console.log(this.listaPromociones);
  }
  
  async closeModal(){
    await this.modalC.dismiss();
  }


}
