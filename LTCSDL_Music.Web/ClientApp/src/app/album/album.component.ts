import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-album',
  templateUrl: './album.component.html',
  styleUrls: ['./album.component.css']
})
export class AlbumComponent implements OnInit {

  album: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  albums:any={
    maAb: "AB89",
    tenAb: "TP",
    GhiChu: ""
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchAlbum(1);
  }
  SearchAlbum(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/Album/SearchAlbum',x).subscribe(result => {
      this.album = result;
      this.album = this.album.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.album.page < this.album.totalPage){
      let nextPage = this.album.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/Album/SearchAlbum',x).subscribe(result => {
      this.album = result;
      this.album = this.album.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí cuối cùng")
    }
  }

  SearchPrevious(){
    if(this.album.page >1 ){
      let nextPage = this.album.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/Album/SearchAlbum',x).subscribe(result => {
      this.album = result;
      this.album = this.album.data;
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
      this.albums = {
        maAb: "",
        tenAb: "",
        GhiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.albums = index;
    }
    $('#exampleModal').modal("show");
  }
  addAlbum()
  {
    var x = this.albums;
    this.http.post('https://localhost:44332/' + 'api/Album/create-album',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.albums = r.data;
        this.isEdit = true;
        this.SearchAlbum(1);
        confirm("Thêm album thành công");
      }
    }, error => console.error(error));
  }
  UpdateAlbum()
  {
    var x = this.albums;
    this.http.post('https://localhost:44332/' + 'api/Album/update-album',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.albums = r.data;
        this.isEdit = true;
        this.SearchAlbum(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteAlbum(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.albums = this.album.data[index];
      console.log(index);
      console.log(this.albums);
      var x: any = {maAb: this.albums.maAb}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/Album/Delete-MaAlbum', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchAlbum(1);
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
