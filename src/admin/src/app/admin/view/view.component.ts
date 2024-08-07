import { Component } from '@angular/core';
import { SearchComponent } from '../../shared/search/search.component';
import { AdminUser, BusinessService } from '../business.service';

@Component({
  selector: 'admin-view',
  standalone: true,
  imports: [SearchComponent],
  templateUrl: './view.component.html',
  styleUrl: './view.component.css'
})
export class AdminViewComponent {
  constructor(private biz: BusinessService) {
  }

  get adminList() {
    return this.biz.getAdminList()
  }

  addAdmin(user: AdminUser) {
    this.biz.addAdmin(user)
  }
}
