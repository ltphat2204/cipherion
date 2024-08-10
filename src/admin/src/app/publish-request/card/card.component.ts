import { Component, Input } from '@angular/core';
import { DatePipe } from '@angular/common';
import {MatIconModule} from '@angular/material/icon';

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

  formattedDate: Date | null = null;

  ngOnInit() {
    this.formatTimestamp();
  }

  formatTimestamp() {
    if (this.time && typeof this.time === 'object' && 'seconds' in this.time) {
      this.formattedDate = new Date(this.time.seconds * 1000);
    }
  }
}
