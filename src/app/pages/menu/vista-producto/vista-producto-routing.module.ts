import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { VistaProductoPage } from './vista-producto.page';

const routes: Routes = [
  {
    path: '',
    redirectTo:'product',
      
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
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class VistaProductoPageRoutingModule {}
