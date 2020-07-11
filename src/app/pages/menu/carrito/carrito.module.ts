import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { CarritoPageRoutingModule } from './carrito-routing.module';

import { CarritoPage } from './carrito.page';
import { PagoPage } from '../pago/pago.page';
import { PagoPageModule } from '../pago/pago.module';


@NgModule({
  entryComponents:[
   PagoPage
      ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    CarritoPageRoutingModule,
    PagoPageModule
  ],
  declarations: [CarritoPage],
 
})
export class CarritoPageModule {}

