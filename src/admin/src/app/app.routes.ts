import { Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AdminViewComponent } from './admin/view/view.component';


export const routes: Routes = [
    {
        path: '',
        children: [
            {
                path: '',
                component: DashboardComponent
            },
            {
                path: 'admin',
                component: AdminViewComponent
            },
            {
                path: 'users',
                component: AdminViewComponent
            },
            {
                path: 'publish',
                component: AdminViewComponent
            }
        ]
    }
];
