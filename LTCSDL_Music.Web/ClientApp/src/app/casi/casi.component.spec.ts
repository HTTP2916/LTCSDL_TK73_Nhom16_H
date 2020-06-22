import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CasiComponent } from './casi.component';

describe('CasiComponent', () => {
  let component: CasiComponent;
  let fixture: ComponentFixture<CasiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CasiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CasiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
