import { Component, OnInit } from '@angular/core';
import { BusinessService, Request } from '../business.service';
import { SearchComponent } from '../../shared/search/search.component';
import { CardComponent } from '../card/card.component';

@Component({
  selector: 'app-publish-view',
  standalone: true,
  imports: [SearchComponent, CardComponent],
  templateUrl: './view.component.html',
  styleUrl: './view.component.css'
})
export class PublishViewComponent implements OnInit {
  requests: Request[] = [];
  
  constructor(private biz: BusinessService) { }

  ngOnInit() {
    this.biz.getRequests().subscribe(requests => {
      console.log(requests);
      this.requests = requests;
    });
  }
}