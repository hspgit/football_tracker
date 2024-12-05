import { Component } from '@angular/core';
import {BaseGameDetailsComponent} from "../base-game-details/base-game-details.component";

@Component({
  selector: 'app-update-game',
  standalone: true,
    imports: [
        BaseGameDetailsComponent
    ],
  templateUrl: './update-game.component.html',
  styleUrl: './update-game.component.css'
})
export class UpdateGameComponent {

}
