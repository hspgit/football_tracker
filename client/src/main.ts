import { provideHttpClient } from '@angular/common/http';
import { bootstrapApplication } from '@angular/platform-browser';
import { AppComponent } from './app/app.component';
import {provideAnimations, provideNoopAnimations} from '@angular/platform-browser/animations';
import { provideRouter } from '@angular/router';
import { routes } from './app/app.routes'; // adjust path as needed

bootstrapApplication(AppComponent, {
    providers: [
        provideHttpClient(),
        // provideAnimations(),
        provideNoopAnimations(), // This disables all animations
        provideRouter(routes)
    ]
}).catch(err => console.error(err));


