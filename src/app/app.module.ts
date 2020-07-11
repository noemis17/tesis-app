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
  
    { provide: RouteReuseStrategy, useClass: IonicRouteStrategy }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
