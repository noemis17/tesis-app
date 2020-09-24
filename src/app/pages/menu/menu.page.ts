// import { Component, OnInit } from '@angular/core';

// import { Platform } from '@ionic/angular';
// import { SplashScreen } from '@ionic-native/splash-screen/ngx';
// import { StatusBar } from '@ionic-native/status-bar/ngx';
// import { WebView } from '@ionic-native/ionic-webview/ngx';
// import { Camera, CameraOptions } from '@ionic-native/camera/ngx';

// @Component({
//   selector: 'app-menu',
//   templateUrl: './menu.page.html',
//   styleUrls: ['./menu.page.scss'],
// })
// export class MenuPage implements OnInit {

//   public selectedIndex = 0;
//   email:any;
  
//   public appPages = [
    
    
    
    
//     // {
//     //   title: 'Producto',
//     //   url: '/menu/producto',
//     //   icon: 'card'
//     // },
//     {
//       title: 'Promociones',
//       url: '/menu/promocion',
//       icon: 'pricetags'
//     }
//     ,{
//       title: 'Producto',
//       url: '/menu/vista-producto/product',
//       icon: 'nutrition'
     
//     }, {
//       title: 'Carrito',
//       url: '/menu/carrito',
//       icon: 'cart'
//     }
//     , {
//       title: 'Compra',
//       url: '/menu/compra',
//       icon: 'basket'
//     }
//     , {
//       title: 'Perfil',
//       url: '/menu/perfil',
//       icon: 'person-circle'
      
//     }
//     // , {
//     //   title: 'Pago',
//     //   url: '/menu/paypal',
//     //   icon: 'archive'
//     // }
//     , {
//       title: 'Orden',
//       url: '/menu/orden',
//       icon: 'archive'
//     },
//     {
     
//       title: 'Cerrar sesión',
//       url: '/login',
//       icon: 'close-circle',
     
     
//     },
    
//   ];
//   public labels = ['Family', 'Friends', 'Notes', 'Work', 'Travel', 'Reminders'];

//   constructor(
//     private platform: Platform,
//     private splashScreen: SplashScreen,
//     private statusBar: StatusBar,
//     private camera: Camera,
//     private webView: WebView
//   ) {
//     this.initializeApp();
//   }

//   initializeApp() {
//     this.platform.ready().then(() => {
//       this.statusBar.styleDefault();
//       this.splashScreen.hide();
//     });
//   }

//   ngOnInit() {
//     this.email= localStorage.getItem("email");
//     const path = window.location.pathname.split('folder/')[1];
//     if (path !== undefined) {
//       this.selectedIndex = this.appPages.findIndex(page => page.title.toLowerCase() === path.toLowerCase());
//     }
//   }
//   image: string;
//   takePicture() {
//     const options: CameraOptions = {
//       quality: 100,
//       destinationType: this.camera.DestinationType.FILE_URI,
//       encodingType: this.camera.EncodingType.JPEG,
//       mediaType: this.camera.MediaType.PICTURE,
//       sourceType: this.camera.PictureSourceType.CAMERA
//     };
//     this.camera.getPicture(options)
//     .then((imageData) => {
//       this.image = this.webView.convertFileSrc(imageData);
//     }, (err) => {
//       console.log(err);
//     });
//   }

// }

import { Component, OnInit } from '@angular/core';

import { Platform } from '@ionic/angular';
import { SplashScreen } from '@ionic-native/splash-screen/ngx';
import { StatusBar } from '@ionic-native/status-bar/ngx';
import { WebView } from '@ionic-native/ionic-webview/ngx';
import { Camera, CameraOptions } from '@ionic-native/camera/ngx';
import { UsuarioService } from 'src/app/Servicios/usuario.service';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.page.html',
  styleUrls: ['./menu.page.scss'],
})
export class MenuPage implements OnInit {

  public selectedIndex = 0;
  email:any;
  
  public appPages = [
   
    // {
    //   title: 'Promociones',
    //   url: '/menu/promocion',
    //   icon: 'pricetags'
    // }
    // ,{
    //   title: 'Producto',
    //   url: '/menu/vista-producto/product',
    //   icon: 'nutrition'
     
    // }, {
    //   title: 'Carrito',
    //   url: '/menu/carrito',
    //   icon: 'cart'
    // }
    // , {
    //   title: 'Compra',
    //   url: '/menu/compra',
    //   icon: 'basket'
    // }
    // , {
    //   title: 'Perfil',
    //   url: '/menu/perfil',
    //   icon: 'person-circle'
      
    // }
    // // , {
    // //   title: 'Pago',
    // //   url: '/menu/paypal',
    // //   icon: 'archive'
    // // }
    // , {
    //   title: 'Orden',
    //   url: '/menu/orden',
    //   icon: 'archive'
    // },
    {
     
      title: 'Cerrar sesión',
      url: '/login',
      icon: 'close-circle',
     
     
    },
    
  ];

  public labels = ['Family', 'Friends', 'Notes', 'Work', 'Travel', 'Reminders'];

  constructor(
    private platform: Platform,
    private splashScreen: SplashScreen,
    private statusBar: StatusBar,
    private camera: Camera,
    private UsuarioService:UsuarioService,
    private webView: WebView
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(() => {
      this.statusBar.styleDefault();
      this.splashScreen.hide();
    });
    this.menu();
  }
 
  ngOnInit() {
    this.email= localStorage.getItem("email");
    const path = window.location.pathname.split('folder/')[1];
    if (path !== undefined) {
      this.selectedIndex = this.appPages.findIndex(page => page.title.toLowerCase() === path.toLowerCase());
    }
  }
  image: string;
  takePicture() {
    const options: CameraOptions = {
      quality: 100,
      destinationType: this.camera.DestinationType.FILE_URI,
      encodingType: this.camera.EncodingType.JPEG,
      mediaType: this.camera.MediaType.PICTURE,
      sourceType: this.camera.PictureSourceType.CAMERA
    };
    this.camera.getPicture(options)
    .then((imageData) => {
      this.image = this.webView.convertFileSrc(imageData);
    }, (err) => {
      console.log(err);
    });
  }
  menu(){
   
    const rutasCliente = [

      {
        title: 'Promociones',
        url: '/menu/promocion',
        icon: 'pricetags'
      }
      ,{
        title: 'Producto',
        url: '/menu/vista-producto/product',
        icon: 'nutrition'
       
      }, {
        title: 'Carrito',
        url: '/menu/carrito',
        icon: 'cart'
      }
      , {
        title: 'Compra',
        url: '/menu/compra',
        icon: 'basket'
      }
      , {
        title: 'Perfil',
        url: '/menu/perfil',
        icon: 'person-circle'
        
      }
      
      ,{
       
        title: 'Cerrar sesión',
        url: '/login',
        icon: 'close-circle', 
      },
    ];

    const rutasCourier = [
      {
        title: 'Orden',
        url: '/menu/orden',
        icon: 'archive'
      },
      {
       
        title: 'Cerrar sesión',
        url: '/login',
        icon: 'close-circle', 
      },
    ];
  
    const user_tipo=localStorage.getItem("cod");
    
    console.log('tipo:',user_tipo);
    if (user_tipo=="002") {
      
      this.appPages= rutasCourier;
    }
    else{
      this.appPages= rutasCliente;
    }
    // if (miCuenta_tipo_cod=="003") {
    //   this.appPages= rutasCliente;
    // }
    // if (miCuenta_tipo_cod=="001") {
    //   //console.log(item.items.tipo.cod );      
    //   this.appPages= rutasTodo;
    // }
  }
}