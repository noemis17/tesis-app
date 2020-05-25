import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';
import { Routes, RouterModule } from '@angular/router';
import { VistaProductoPageRoutingModule } from './vista-producto-routing.module';
import { ProductoPage } from '../producto/producto.page';
import { VistaProductoPage } from './vista-producto.page';
import { ComponentsModule } from 'src/app/components/components.module';
import { ProductoPageModule } from '../producto/producto.module';

const routes: Routes = [
  {
    path: '',
    redirectTo:'product'
  },
  {
    path: '',
    component: VistaProductoPage,
    children: [
      {
        path: 'product',
        loadChildren: '../producto/producto.module#ProductoPageModule',
       
      }
    ]
  }

];
@NgModule({
  entryComponents:[
    ProductoPage
      ],
  imports: [
    RouterModule.forChild(routes),
    CommonModule,
    FormsModule,
    IonicModule,
    VistaProductoPageRoutingModule,
    ComponentsModule,
    ProductoPageModule

   
  ],
  exports: [RouterModule],
  declarations: [VistaProductoPage]
})
export class VistaProductoPageModule {}
