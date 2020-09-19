import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { RouteReuseStrategy } from '@angular/router';

import { IonicModule, IonicRouteStrategy } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { Geolocation } from '@ionic-native/geolocation/ngx';
import { ComponentsModule } from './components/components.module';
import { HttpClientModule } from '@angular/common/http';
import { RutaService } from './Servicios/Rutas/ruta.service';
import { ReactiveFormsModule, FormsModule} from '@angular/forms';
import { PipesModule } from './pipes/pipes.module';
import { PayPal } from '@ionic-native/paypal/ngx';
import { Camera } from '@ionic-native/camera/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import { LocalNotifications} from '@ionic-native/local-notifications/ngx'

import { NativeGeocoder } from '@ionic-native/native-geocoder/ngx';

import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer/ngx';

import { ImagePicker } from '@ionic-native/image-picker/ngx';
import { PagoPageModule } from './pages/menu/pago/pago.module';
@NgModule({
  declarations: [
    AppComponent
  ],
  entryComponents: [

  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    IonicModule.forRoot(),
    AppRoutingModule,
    FormsModule,
    ComponentsModule,
    ReactiveFormsModule,
    PipesModule,
    PagoPageModule,
     
  ],
  providers: [
    StatusBar,
    SplashScreen,
    Geolocation,
    RutaService,
    PayPal,
    Camera,
    WebView,
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
    LocalNotifications,
    ImagePicker,
    FileTransfer, 
    // FileUploadOptions,
    FileTransferObject,
    // File,
    NativeGeocoder
   
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
