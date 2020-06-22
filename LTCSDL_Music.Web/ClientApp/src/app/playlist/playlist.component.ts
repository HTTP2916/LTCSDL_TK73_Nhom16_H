import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-playlist',
  templateUrl: './playlist.component.html',
  styleUrls: ['./playlist.component.css']
})
export class PlaylistComponent implements OnInit {

  playlist: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  playlists:any={
    maPlayList: "AB89",
    tenPlaylist: "TP",
    maBaiHat: "KR9",
    maUser: "U1",
    ghiChu: ""
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchPlayList(1);
  }
  SearchPlayList(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/PlayList/SearchPlayList',x).subscribe(result => {
      this.playlist = result;
      this.playlist = this.playlist.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.playlist.page < this.playlist.totalPage){
      let nextPage = this.playlist.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/PlayList/SearchPlayList',x).subscribe(result => {
      this.playlist = result;
      this.playlist = this.playlist.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí cuối cùng")
    }
  }

  SearchPrevious(){
    if(this.playlist.page >1 ){
      let nextPage = this.playlist.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/PlayList/SearchPlayList',x).subscribe(result => {
      this.playlist = result;
      this.playlist = this.playlist.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí đầu tiên")
    }
  }
  openModal(isNew,index)
  {
    if (isNew)
    {
      this.isEdit = false;
      this.playlists = {
        maPlayList: "",
        tenPlaylist: "",
        maBaiHat: "",
        maUser: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.playlists = index;
    }
    $('#exampleModal').modal("show");
  }
  addPlayList()
  {
    var x = this.playlists;
    this.http.post('https://localhost:44332/' + 'api/PlayList/create-playlist',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.playlists = r.data;
        this.isEdit = true;
        this.SearchPlayList(1);
        confirm("Thêm playlist thành công");
      }
    }, error => console.error(error));
  }
  UpdatePlayList()
  {
    var x = this.playlists;
    this.http.post('https://localhost:44332/' + 'api/PlayList/update-playlist',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.playlists = r.data;
        this.isEdit = true;
        this.SearchPlayList(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deletePlayList(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.playlists = this.playlist.data[index];
      console.log(index);
      console.log(this.playlists);
      var x: any = {maPlayList: this.playlists.maPlayList}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/PlayList/Delete-MaPlayList', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchPlayList(1);
          alert("Xóa thành công!");
        }
        else {
          confirm("Không thành công");
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }

}
