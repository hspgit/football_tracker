import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MajorLeagueSoccerComponent } from './major-league-soccer.component';

describe('MajorLeagueSoccerComponent', () => {
  let component: MajorLeagueSoccerComponent;
  let fixture: ComponentFixture<MajorLeagueSoccerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MajorLeagueSoccerComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MajorLeagueSoccerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
