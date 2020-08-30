import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { CarritoPageRoutingModule } from './carrito-routing.module';

import { CarritoPage } from './carrito.page';
import { PagoPage } from '../pago/pago.page';
import { PagoPageModule } from '../pago/pago.module';
import { UbicacionPage } from '../ubicacion/ubicacion.page';
import { UbicacionPageModule } from '../ubicacion/ubicacion.module';
@NgModule({
  entryComponents:[
   PagoPage,
   UbicacionPage
      ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    CarritoPageRoutingModule,
    PagoPageModule,
    UbicacionPageModule
  ],
  declarations: [CarritoPage],
 
})
export class CarritoPageModule {}

