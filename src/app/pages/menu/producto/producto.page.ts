import { Component, OnInit,ViewChild} from '@angular/core';
import { ProductosService} from '../../../Servicios/productos.service';
import { ModalController, IonInfiniteScroll } from '@ionic/angular';
import { AlertController } from '@ionic/angular';
import { Router } from '@angular/router';
import { NotificacionesService } from 'src/app/Servicios/notificaciones.service';
import { LocalNotifications } from '@ionic-native/local-notifications/ngx';
import { TransportistaService } from '../../../Servicios/transportista.service'
@Component({
  selector: 'app-producto',
  templateUrl: './producto.page.html',
  styleUrls: ['./producto.page.scss'],
})
export class ProductoPage implements OnInit {
  @ViewChild(IonInfiniteScroll,{static:false}) infiniteScroll: IonInfiniteScroll;
 carritoProducto=[];
producto:any;

variable:string;
textoBuscar='';
iconoCargando = false;
  constructor( private productoServi:ProductosService,
    private modalC:ModalController,
    public alertController: AlertController,
    private router:Router
    ,private _notificacionesService: NotificacionesService  //servicio de notificaciones
    ,private localNotifications: LocalNotifications,
    private transportistaServe: TransportistaService,
    ) {

  }

  ngOnInit() {

   this.mostrar();
        if(localStorage.getItem("cod")=='002'){
            setInterval(() => {
             
              navigator.geolocation.getCurrentPosition(position => {
                
                this.transportistaServe.guardarUbicacionTransportista(position.coords.longitude, position.coords.latitude, localStorage.getItem("id"))
                .then((ok) => {
                 })
                 .catch((error) => {
                   console.log(error);
                  });
                
              });
             
            },60000);
          }
    setInterval(() => {
      this._notificacionesService.getNotificaciones(localStorage.getItem('id')).then(data=>{
        
        if (data['code']=='200') {
          this.localNotifications.schedule({
            id: 1,
            text: data['items']['mensaje'],
            // sound: isAndroid? 'file://sound.mp3': 'file://beep.caf',
            data: { secret:  "key" }
          });
        } else {
          
        }


      });
    },20000);
    
  }

  notificacion (_mensaje:string){

    this.localNotifications.schedule({
      id: 1,
      text: _mensaje,
      // sound: isAndroid? 'file://sound.mp3': 'file://beep.caf',
      data: { secret:  "key" }
    });

  }
  

  // mostrarNotificaciones(){
  //   if (localStorage.getItem('id')!=null) {
  //     setInterval(() => {
        
  //     },60000);
  //   }
  // }


  mostrar(){
    this.iconoCargando=true;
    this.productoServi.mostrarProducto()
    .then(data=>{
      if(data['code']=="200"){
        this.producto=data['items'];
      console.log('Muestra todos los productos:',this.producto);
      }

    }).catch((error) => console.log('No se muestra los productos:',error))
      .finally(() => this.iconoCargando=false);
  }

  verProducto(_item){
    console.log(_item);
    localStorage.setItem("IdItemProducto",_item.id);
    if (localStorage.getItem("IdItemProducto")!=null) { //si se seteo bien
      this.router.navigateByUrl('/menu/producto-detalle');
    } else {

    }
  }

   buscar(evento){
    const texto=evento.target.value;
    this.textoBuscar=texto;
  }


  verificarExiste(item){
    var dato :any[]=[];
    dato = JSON.parse(localStorage.getItem("carrito"));
    if(dato == null){
      this.presentAlertPrompt(item);
    }else{
      if(dato.length == undefined){
        if(dato['id'] == item['id']){
          this.showAlert("Ya esta en el carrito")
        }else{
          this.presentAlertPrompt(item);
        }
      }else{
        var DatoABuscar = dato.filter(e=>e['id'] == item['id']);
        if(DatoABuscar.length ==0){
          this.presentAlertPrompt(item);
        }else{
          this.showAlert("Ya esta en el carrito")
          //aqui tiene que mostrar un alert que diga que este prodcuto ya esta en el carrito
        }
      }
    }
  }
agregarCarrito(item){

  if(JSON.parse(localStorage.getItem("carrito")) == null){
    localStorage.setItem("carrito",JSON.stringify(item));
    }else{
    var myJsonArrayObject=[];
    var carrito=[];
    carrito = JSON.parse(localStorage.getItem("carrito"));
    if(carrito.length>=2){
      carrito.map(option=>
        myJsonArrayObject.push(option)
      );
    }else{
      myJsonArrayObject.push(JSON.parse(localStorage.getItem("carrito")));
    }
    myJsonArrayObject.push(item);
    myJsonArrayObject = myJsonArrayObject.filter(e=>e!=null);
    localStorage.removeItem("carrito");
    localStorage.setItem("carrito",JSON.stringify(myJsonArrayObject));

}

}
async presentAlertPrompt(item) {
          var stock = 0;
          if(item.promocionesdel_producto == null){
            stock = item.stock;
          }else{
            stock = item.promocionesdel_producto.stock;
          }
          if (1>stock) {
            this.showAlert("No hay la cantidad necesaria")
          }
          else {
            item["cantidad"]=1;
            this.agregarCarrito(item);
            //this.showAlert("correcto")
            //console.log("correcto")
            //console.log('Confirm Ok',data);
          }
          this.router.navigateByUrl('/menu/carrito');
  // const alert = await this.alertController.create({
  //   mode:"ios" ,
  //   header: 'Cantidad a comprar',
  //   inputs: [
  //     {
  //       name:'cantidad',
  //       type: 'number',
  //       min: item.stock,
  //       max: item.stock,
  //       placeholder: 'cantidad'
  //     },
  //
  //   ],
  //   buttons: [
  //     {
  //       text: 'Cancel',
  //       handler: () => {
  //         console.log('Confirm Cancel');
  //       }
  //     },
  //     {
  //       text: 'ok',
  //       handler: (data) => {
  //         var stock = 0;
  //         if(item.promocionesdel_producto == null){
  //           stock = item.stock;
  //         }else{
  //           stock = item.promocionesdel_producto.stock;
  //         }
  //         if (data.cantidad>stock) {
  //           this.showAlert("No hay la cantidad necesaria")
  //         }
  //         else {
  //           item["cantidad"]=data.cantidad;
  //           this.agregarCarrito(item);
  //           //this.showAlert("correcto")
  //           //console.log("correcto")
  //           //console.log('Confirm Ok',data);
  //         }
  //         this.router.navigateByUrl('/menu/carrito');
  //       }
  //     }
  //   ]
  //
  // });
  // await alert.present();
}
async showAlert (Mensaje) {
  const alert = await this.alertController.create({
    message: Mensaje,
    buttons: ['ok']
  });
  await alert.present();
};

cargarproducto(event){
  setTimeout(() => {

      if (this.producto.length ==10) {
        event.target.complete();
        this.infiniteScroll.disabled=true;
        return;
      }
    const cargando=Array(10);
    this.producto.push(...cargando);
    event.target.complete();
  }, 2000);

}

rutadelcarrito(){
  this.router.navigate(['/menu/carrito']);
}
// public function changeimage(Request $request, $id){
//         $target_dir = public_path()."/imagenes/";
//         $target_file = $target_dir . basename($_FILES["file"]["name"]);
//         $uploadOk = 1;
//         $imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
//         $check = getimagesize($_FILES["file"]["tmp_name"]);
//         if($check !== false) {
//             $uploadOk = 1;
//             if (move_uploaded_file($_FILES["file"]["tmp_name"], $target_file)) {
//                 $image=Users::where('id', $id)->first();
//                 $image->imagen = basename( $_FILES["file"]["name"]);
//                 $image->save();
//                 return response()->json(['message'=>'The file has been uploaded.'], 200);
//             } else {
//                 return response()->json(['message'=>'Error al subir imagen'], 400);
//             }
//         } else {
//             return response()->json(['message'=>'File is not an image.'], 400);
//             $uploadOk = 0;
//         }
//     }
}
