import { Component, Input } from '@angular/core';
import { DatePipe } from '@angular/common';
import {MatIconModule} from '@angular/material/icon';
import { BusinessService } from '../business.service';
import {MatSnackBar} from '@angular/material/snack-bar';

@Component({
  selector: 'requests-card',
  standalone: true,
  imports: [DatePipe, MatIconModule],
  templateUrl: './card.component.html',
  styleUrl: './card.component.css'
})
export class CardComponent {
  @Input() id: string = "";
  @Input() artist: string = "";
  @Input() coverImage: string = "";
  @Input() url: string = "";
  @Input() genre: string = "";
  @Input() songName: string = "";
  @Input() user: string = "";
  @Input() time: any;

  constructor(private biz: BusinessService, private snackbar: MatSnackBar) { }

  formattedDate: Date | null = null;

  ngOnInit() {
    this.formatTimestamp();
  }

  async acceptRequest() {
    fetch('http://54.151.129.13/v1/song/create', {
      method: 'POST',
      headers:{
        'Content-Type': 'application/x-www-form-urlencoded'
      },    
      body: new URLSearchParams({
        name : this.songName,
        id : this.id,
      }),
    }).then(response => response.json())
    .then(async data => {
      console.log('Success:', data);
      await this.biz.acceptRequest(this.id);
      this.snackbar.open('Song accepted', 'Close')
    })
    .catch((error) => {
      console.error('Error:', error);
    });
  }

  async rejectRequest() {
    await this.biz.rejectRequest(this.id);
    this.snackbar.open('Song rejected', 'Close')
  }

  formatTimestamp() {
    if (this.time && typeof this.time === 'object' && 'seconds' in this.time) {
      this.formattedDate = new Date(this.time.seconds * 1000);
    }
  }
}
