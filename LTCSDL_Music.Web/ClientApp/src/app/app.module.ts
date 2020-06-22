import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NavMenuComponent } from './nav-menu/nav-menu.component';
import { HomeComponent } from './home/home.component';
import { CounterComponent } from './counter/counter.component';
import { BaihatComponent } from './baihat/baihat.component';
import { CasiComponent } from './casi/casi.component';
import { AlbumComponent } from './album/album.component';
import { TheloaiComponent } from './theloai/theloai.component';
import { PlaylistComponent } from './playlist/playlist.component';
import { UserComponent } from './user/user.component';
import { QuantrivienComponent } from './quantrivien/quantrivien.component';

@NgModule({
  declarations: [
    AppComponent,
    NavMenuComponent,
    HomeComponent,
    CounterComponent,
    BaihatComponent,
    CasiComponent,
    AlbumComponent,
    TheloaiComponent,
    PlaylistComponent,
    UserComponent,
    QuantrivienComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: HomeComponent, pathMatch: 'full' },
      { path: 'counter', component: CounterComponent },
      { path: 'baihat', component: BaihatComponent },
      { path: 'casi', component: CasiComponent },
      { path: 'album', component: AlbumComponent },
      { path: 'theloai', component: TheloaiComponent },
      { path: 'playlist', component: PlaylistComponent },
      { path: 'nguoidung', component: UserComponent },
      { path: 'quantrivien', component: QuantrivienComponent },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
