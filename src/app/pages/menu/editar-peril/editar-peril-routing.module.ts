import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { EditarPerilPage } from './editar-peril.page';

const routes: Routes = [
  {
    path: '',
    component: EditarPerilPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class EditarPerilPageRoutingModule {}
