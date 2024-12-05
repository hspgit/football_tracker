import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BaseGameDetailsComponent } from './base-game-details.component';

describe('BaseGameDetailsComponent', () => {
  let component: BaseGameDetailsComponent;
  let fixture: ComponentFixture<BaseGameDetailsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BaseGameDetailsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BaseGameDetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
