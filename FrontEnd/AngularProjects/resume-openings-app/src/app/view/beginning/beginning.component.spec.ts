import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BeginningComponent } from './beginning.component';

describe('BeginningComponent', () => {
  let component: BeginningComponent;
  let fixture: ComponentFixture<BeginningComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [BeginningComponent]
    });
    fixture = TestBed.createComponent(BeginningComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
