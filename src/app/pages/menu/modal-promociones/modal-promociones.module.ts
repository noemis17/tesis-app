import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ModalPromocionesPageRoutingModule } from './modal-promociones-routing.module';

import { ModalPromocionesPage } from './modal-promociones.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ModalPromocionesPageRoutingModule
  ],
  declarations: [ModalPromocionesPage]
})
export class ModalPromocionesPageModule {}
