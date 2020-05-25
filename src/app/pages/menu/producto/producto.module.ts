import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { ProductoPageRoutingModule } from './producto-routing.module';

import { ProductoPage } from './producto.page';
import { ComponentsModule } from 'src/app/components/components.module';
import { ModalPromocionesPage } from '../modal-promociones/modal-promociones.page';
import { ModalPromocionesPageModule } from '../modal-promociones/modal-promociones.module';

@NgModule({
  entryComponents:[
ModalPromocionesPage
  ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    ProductoPageRoutingModule,
    ComponentsModule,
    ModalPromocionesPageModule
  ],
  declarations: [ProductoPage]
})
export class ProductoPageModule {}
