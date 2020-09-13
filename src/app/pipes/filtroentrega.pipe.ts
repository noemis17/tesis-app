import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filtroentrega'
})
export class FiltroentregaPipe implements PipeTransform {

  transform(arreglo: any[],texto: string,columna:string,subcolumna:string): any {
    // return null;
    console.log(arreglo);
    
    if (texto==='') {
      return arreglo;
    }

    texto.toLowerCase();
    
    return arreglo.filter(item=>{
      //console.log('cols',item[columna][subcolumna]);
      return item[columna][subcolumna].toLowerCase().includes(texto);
    });

    // console.log(arreglo);
    // return arreglo;
  }

}
