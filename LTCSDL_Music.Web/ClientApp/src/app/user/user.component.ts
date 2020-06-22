import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  nguoidung: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  nguoidungs:any={
    maUser: "AB89",
    tenUser: "TP",
    matKhau: "KR9",
    ngaySinh: "U1",
    gioiTinh: "KR9",
    ghiChu: "U1"
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchNguoiDung(1);
  }
  SearchNguoiDung(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/NguoiDung/SearchNguoiDung',x).subscribe(result => {
      this.nguoidung = result;
      this.nguoidung = this.nguoidung.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.nguoidung.page < this.nguoidung.totalPage){
      let nextPage = this.nguoidung.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/NguoiDung/SearchNguoiDung',x).subscribe(result => {
      this.nguoidung = result;
      this.nguoidung = this.nguoidung.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí cuối cùng")
    }
  }

  SearchPrevious(){
    if(this.nguoidung.page >1 ){
      let nextPage = this.nguoidung.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/NguoiDung/SearchNguoiDung',x).subscribe(result => {
      this.nguoidung = result;
      this.nguoidung = this.nguoidung.data;
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
      this.nguoidungs = {
        maUser: "",
        tenUser: "",
        matKhau: "",
        ngaySinh: "",
        gioiTinh: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.nguoidungs = index;
    }
    $('#exampleModal').modal("show");
  }
  addNguoiDung()
  {
    var x = this.nguoidungs;
    this.http.post('https://localhost:44332/' + 'api/NguoiDung/create-nguoidung',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.nguoidungs = r.data;
        this.isEdit = true;
        this.SearchNguoiDung(1);
        confirm("Thêm user thành công");
      }
    }, error => console.error(error));
  }
  UpdateNguoiDung()
  {
    var x = this.nguoidungs;
    this.http.post('https://localhost:44332/' + 'api/NguoiDung/update-nguoidung',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.nguoidungs = r.data;
        this.isEdit = true;
        this.SearchNguoiDung(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteNguoiDung(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.nguoidungs = this.nguoidung.data[index];
      console.log(index);
      console.log(this.nguoidungs);
      var x: any = {maUser: this.nguoidungs.maUser}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/NguoiDung/delete-nguoidung', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchNguoiDung(1);
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
