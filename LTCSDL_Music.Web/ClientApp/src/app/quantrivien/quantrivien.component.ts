import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-quantrivien',
  templateUrl: './quantrivien.component.html',
  styleUrls: ['./quantrivien.component.css']
})
export class QuantrivienComponent implements OnInit {

  quantrivien: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  quantriviens:any={
    maQuanTri: "AB89",
    tenQtv: "TP",
    ngaySinh: "KR9",
    ghiChu: "U1"
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchQTV(1);
  }
  SearchQTV(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/QuanTriVien/SearchQuanTriVien',x).subscribe(result => {
      this.quantrivien = result;
      this.quantrivien = this.quantrivien.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.quantrivien.page < this.quantrivien.totalPage){
      let nextPage = this.quantrivien.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/QuanTriVien/SearchQuanTriVien',x).subscribe(result => {
      this.quantrivien = result;
      this.quantrivien = this.quantrivien.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí cuối cùng")
    }
  }

  SearchPrevious(){
    if(this.quantrivien.page >1 ){
      let nextPage = this.quantrivien.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/QuanTriVien/SearchQuanTriVien',x).subscribe(result => {
      this.quantrivien = result;
      this.quantrivien = this.quantrivien.data;
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
      this.quantriviens = {
        maQuanTri: "",
        tenQtv: "",
        ngaySinh: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.quantriviens = index;
    }
    $('#exampleModal').modal("show");
  }
  addQuanTriVien()
  {
    var x = this.quantriviens;
    this.http.post('https://localhost:44332/' + 'api/QuanTriVien/create-quantrivien',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.quantriviens = r.data;
        this.isEdit = true;
        this.SearchQTV(1);
        confirm("Thêm thành công");
      }
    }, error => console.error(error));
  }
  UpdateQuanTriVien()
  {
    var x = this.quantriviens;
    this.http.post('https://localhost:44332/' + 'api/QuanTriVien/update-quantrivien',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.quantriviens = r.data;
        this.isEdit = true;
        this.SearchQTV(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteQuanTriVien(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.quantriviens = this.quantrivien.data[index];
      console.log(index);
      console.log(this.quantriviens);
      var x: any = {maQuanTri: this.quantriviens.maQuanTri}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/QuanTriVien/delete-quantrivien', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchQTV(1);
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
