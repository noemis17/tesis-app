import { NgModule } from '@angular/core';

import { FiltroPipe } from './filtro.pipe';
import { FiltroentregaPipe } from './filtroentrega.pipe';






@NgModule({
  declarations: [FiltroPipe, FiltroentregaPipe],
  exports: [
    FiltroPipe,
   FiltroentregaPipe

  ]
})
export class PipesModule { }
