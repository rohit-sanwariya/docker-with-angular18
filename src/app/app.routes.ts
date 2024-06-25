import { Routes } from '@angular/router';
import { redirecttohomeGuard } from './redirecttohome.guard';

export const routes: Routes = [
    {
        path:'',redirectTo:'login',pathMatch:'full'
    },
    {
        path:'home',loadComponent:()=>import('./homepage/homepage.component').then(m=>m.HomepageComponent),

       
    },
    {
        path:'login',
        loadComponent:()=>import('./loginpage/loginpage.component').then(m=>m.LoginpageComponent),
        canActivate:[redirecttohomeGuard],
    }
];
