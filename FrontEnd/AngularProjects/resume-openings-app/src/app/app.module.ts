import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BeginningComponent } from './view/beginning/beginning.component';
import { ResumesComponent } from './view/resumes/resumes.component';
import { OpeningsComponent } from './view/openings/openings.component';
import { OpeningsPaneComponent } from './view/openings-pane/openings-pane.component';
import { HeaderComponent } from './template/header/header.component';
import { FooterComponent } from './template/footer/footer.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    AppComponent,
    BeginningComponent,
    ResumesComponent,
    OpeningsComponent,
    OpeningsPaneComponent,
    HeaderComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
