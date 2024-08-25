import { Component } from '@angular/core';
import { Chart, registerables } from 'chart.js';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent {
  genreChart: any;
  userGrowthChart: any;
  listeningHoursChart: any;
  topArtistsChart: any;

  constructor() {
    Chart.register(...registerables);
  }

  ngOnInit(): void {
    this.createGenreChart();
    this.createUserGrowthChart();
    this.createListeningHoursChart();
    this.createTopArtistsChart();
  }

  createGenreChart(): void {
    this.genreChart = new Chart('genreStats', {
      type: 'bar',
      data: {
        labels: ['Rock', 'Pop', 'Jazz', 'Classical', 'Hip Hop', 'Electronic'],
        datasets: [{
          label: 'Number of Tracks',
          data: [1200, 1900, 800, 500, 1500, 1000],
          backgroundColor: [
            'rgba(255, 99, 132, 0.8)',
            'rgba(54, 162, 235, 0.8)',
            'rgba(255, 206, 86, 0.8)',
            'rgba(75, 192, 192, 0.8)',
            'rgba(153, 102, 255, 0.8)',
            'rgba(255, 159, 64, 0.8)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  createUserGrowthChart(): void {
    this.userGrowthChart = new Chart('userGrowth', {
      type: 'line',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        datasets: [{
          label: 'New Users',
          data: [1000, 1500, 2000, 2500, 3000, 3500],
          fill: false,
          borderColor: 'rgb(75, 192, 192)',
          tension: 0.1
        }]
      },
      options: {
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }

  createListeningHoursChart(): void {
    this.listeningHoursChart = new Chart('listeningHours', {
      type: 'doughnut',
      data: {
        labels: ['Morning', 'Afternoon', 'Evening', 'Night'],
        datasets: [{
          label: 'Listening Hours',
          data: [4, 5, 8, 3],
          backgroundColor: [
            'rgba(255, 99, 132, 0.8)',
            'rgba(54, 162, 235, 0.8)',
            'rgba(255, 206, 86, 0.8)',
            'rgba(75, 192, 192, 0.8)'
          ],
          hoverOffset: 4
        }]
      }
    });
  }

  createTopArtistsChart(): void {
    this.topArtistsChart = new Chart('topArtists', {
      type: 'bar',  // Changed from 'horizontalBar' to 'bar'
      data: {
        labels: ['Artist A', 'Artist B', 'Artist C', 'Artist D', 'Artist E'],
        datasets: [{
          label: 'Plays',
          data: [12000, 10000, 8000, 7500, 6000],
          backgroundColor: [
            'rgba(255, 99, 132, 0.8)',
            'rgba(54, 162, 235, 0.8)',
            'rgba(255, 206, 86, 0.8)',
            'rgba(75, 192, 192, 0.8)',
            'rgba(153, 102, 255, 0.8)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        indexAxis: 'y',  // This makes the bars horizontal
        scales: {
          x: {
            beginAtZero: true
          }
        }
      }
    });
  }
}
