import { Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-search',
  standalone: true,
  imports: [],
  templateUrl: './search.component.html',
  styleUrl: './search.component.css'
})
export class SearchComponent {
  @Input() placeholder: string = "Search...";
  @Input() search: string = "";
  @Output() searchChange = new EventEmitter<string>();

  onSearchChange(event: Event): void {
    const input = event.target as HTMLInputElement;
    if (input) {
      this.search = input.value;
      this.searchChange.emit(input.value);
    }
  }
}
