import { Component } from '@angular/core';
import { SearchComponent } from '../../shared/search/search.component';

@Component({
  selector: 'admin-view',
  standalone: true,
  imports: [SearchComponent],
  templateUrl: './view.component.html',
  styleUrl: './view.component.css'
})
export class AdminViewComponent {

}
