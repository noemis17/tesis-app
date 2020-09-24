import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { IonicModule } from '@ionic/angular';

import { MenuPageRoutingModule } from './menu-routing.module';

import { MenuPage } from './menu.page';
import { ComponentsModule } from 'src/app/components/components.module';
import { LocalNotifications} from '@ionic-native/local-notifications/ngx';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    MenuPageRoutingModule,
    ComponentsModule
  ],
  providers: [
    LocalNotifications,
  ],
  declarations: [MenuPage,]
})
export class MenuPageModule {}
