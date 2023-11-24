import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BeginningComponent } from './view/beginning/beginning.component';
import { OpeningsComponent } from './view/openings/openings.component';
import { OpeningsPaneComponent } from './view/openings-pane/openings-pane.component';
import { ResumesComponent } from './view/resumes/resumes.component';

const routes: Routes = [
  {path: '', component:BeginningComponent},
  {path: 'resumes', component:ResumesComponent},
  {path: 'openings', component:OpeningsComponent},
  {path: 'openingspane', component:OpeningsPaneComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
