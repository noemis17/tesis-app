import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';
import {MapaPage } from '../mapa/mapa.page';
import { OrdenPageRoutingModule } from './orden-routing.module';

import { OrdenPage } from './orden.page';
import { MapaPageModule } from '../mapa/mapa.module';
import { PipesModule } from 'src/app/pipes/pipes.module';

@NgModule({
  entryComponents:[
   MapaPage
      ],
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    OrdenPageRoutingModule,
    MapaPageModule,
    PipesModule
  ],
  declarations: [OrdenPage]
})
export class OrdenPageModule {}
