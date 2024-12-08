import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BaseLeagueTableComponent } from './base-league-table.component';

describe('BaseLeagueTableComponent', () => {
  let component: BaseLeagueTableComponent;
  let fixture: ComponentFixture<BaseLeagueTableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BaseLeagueTableComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(BaseLeagueTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
