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
<<<<<<< HEAD
import { ImagePicker } from '@ionic-native/image-picker/ngx';
// import { File } from '@ionic-native/file';
// import { CargarImgProvider } from '../providers/cargar-img/cargar-img';
// import { ServiceProvider } from '../providers/service/service';

=======
import { FileTransfer, FileUploadOptions, FileTransferObject } from '@ionic-native/file-transfer';
>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
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
    PipesModule



  ],
  providers: [
    StatusBar,
    SplashScreen,
    Geolocation,
    RutaService,
    PayPal,
    Camera,
    WebView,
<<<<<<< HEAD
=======


>>>>>>> 39db52d2e4061890f6dc5b9b02f81c9a8b24fb78
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy },
    LocalNotifications,
    ImagePicker,
    // File,
   
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
