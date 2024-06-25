import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const redirecttohomeGuard: 
CanActivateFn = (route, state) => {
  const router = inject(Router)
  router.navigateByUrl('/home');
  return true;
};
