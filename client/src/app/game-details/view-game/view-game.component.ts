import {Component} from '@angular/core';
import {BaseGameDetailsComponent} from '../base-game-details/base-game-details.component';

@Component({
  selector: 'app-view-game',
  standalone: true,
  imports: [
    BaseGameDetailsComponent
  ],
  templateUrl: './view-game.component.html',
  styleUrl: './view-game.component.css'
})
export class ViewGameComponent {

}
