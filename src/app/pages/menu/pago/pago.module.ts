import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';
import { PagoPageRoutingModule } from './pago-routing.module';
import { PagoPage } from './pago.page';
import { ComprobantePage } from '../comprobante/comprobante.page';
import { ComprobantePageModule } from '../comprobante/comprobante.module';

@NgModule({
  entryComponents:[
    ComprobantePage
   
       ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    PagoPageRoutingModule,
    ComprobantePageModule
  ],
  declarations: [PagoPage]
})
export class PagoPageModule {}
