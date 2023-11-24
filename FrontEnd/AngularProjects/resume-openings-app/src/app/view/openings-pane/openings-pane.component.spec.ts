import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OpeningsPaneComponent } from './openings-pane.component';

describe('OpeningsPaneComponent', () => {
  let component: OpeningsPaneComponent;
  let fixture: ComponentFixture<OpeningsPaneComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [OpeningsPaneComponent]
    });
    fixture = TestBed.createComponent(OpeningsPaneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
