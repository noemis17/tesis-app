import { Component, OnInit } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss'],
})
export class MenuPage implements OnInit {

  public selectedIndex = 0;

  public appPages = [
    
    
    {
      title: 'Cerrar sesión',
      url: '/login',
      icon: 'close',
     
    },
    
    // {
    //   title: 'Producto',
    //   url: '/menu/producto',
    //   icon: 'card'
    // },
    {
      title: 'Promociones',
      url: '/menu/promocion',
      icon: 'pricetags'
    }
    ,{
      title: 'Producto',
      url: '/menu/vista-producto/product',
      icon: 'card'
    }, {
      title: 'Carrito',
      url: '/menu/carrito',
      icon: 'cart'
    }
    , {
      title: 'Compra',
      url: '/menu/compra',
      icon: 'archive'
    }
    , {
      title: 'Perfil',
      url: '/menu/perfil',
      icon: 'archive'
    }
    // , {
    //   title: 'Pago',
    //   url: '/menu/paypal',
    //   icon: 'archive'
    // }
    , {
      title: 'Orden',
      url: '/menu/orden',
      icon: 'archive'
    }
    
  ];
  public labels = ['Family', 'Friends', 'Notes', 'Work', 'Travel', 'Reminders'];

  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
  }

  ngOnInit() {
    const path = window.location.pathname.split('folder/')[1];
    if (path !== undefined) {
      this.selectedIndex = this.appPages.findIndex(page => page.title.toLowerCase() === path.toLowerCase());
    }
  }

}
