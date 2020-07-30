import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { EditarPerilPageRoutingModule } from './editar-peril-routing.module';

import { EditarPerilPage } from './editar-peril.page';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    EditarPerilPageRoutingModule
  ],
  declarations: [EditarPerilPage]
})
export class EditarPerilPageModule {}
