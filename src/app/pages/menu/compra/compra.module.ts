import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';
import {MapaPage } from '../mapa/mapa.page';
import { CompraPageRoutingModule } from './compra-routing.module';
import {  ComponentsModule} from '../../../components/components.module';

import { CompraPage } from './compra.page';
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
    CompraPageRoutingModule,
    ComponentsModule,
    MapaPageModule,
    PipesModule
  ],
  declarations: [CompraPage]
})
export class CompraPageModule {}
