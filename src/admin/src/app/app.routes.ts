import { Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AdminViewComponent } from './admin/view/view.component';
import { UserViewComponent } from './user/view/view.component';


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
                component: UserViewComponent
            },
            {
                path: 'publish',
                component: AdminViewComponent
            }
        ]
    }
];
