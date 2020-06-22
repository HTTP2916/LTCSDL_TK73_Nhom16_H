import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-theloai',
  templateUrl: './theloai.component.html',
  styleUrls: ['./theloai.component.css']
})
export class TheloaiComponent implements OnInit {

  theloai: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  theloais:any={
    maTheLoai: "AB89",
    tenTheLoai: "TP",
    ghiChu: ""
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchTheLoai(1);
  }
  SearchTheLoai(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/TheLoai/SearchTheLoai',x).subscribe(result => {
      this.theloai = result;
      this.theloai = this.theloai.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.theloai.page < this.theloai.totalPage){
      let nextPage = this.theloai.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/TheLoai/SearchTheLoai',x).subscribe(result => {
      this.theloai = result;
      this.theloai = this.theloai.data;
    }, error => console.error(error));
    }
    else{
      alert("Bạn đang ở vị trí cuối cùng")
    }
  }

  SearchPrevious(){
    if(this.theloai.page >1 ){
      let nextPage = this.theloai.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/TheLoai/SearchTheLoai',x).subscribe(result => {
      this.theloai = result;
      this.theloai = this.theloai.data;
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
      this.theloais = {
        maTheLoai: "",
        tenTheLoai: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.theloais = index;
    }
    $('#exampleModal').modal("show");
  }
  addTheLoai()
  {
    var x = this.theloais;
    this.http.post('https://localhost:44332/' + 'api/TheLoai/create-theloai',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.theloais = r.data;
        this.isEdit = true;
        this.SearchTheLoai(1);
        confirm("Thêm thể loại thành công");
      }
    }, error => console.error(error));
  }
  UpdateTheLoai()
  {
    var x = this.theloais;
    this.http.post('https://localhost:44332/' + 'api/TheLoai/update-theloai',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.theloais = r.data;
        this.isEdit = true;
        this.SearchTheLoai(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteTheLoai(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.theloais = this.theloai.data[index];
      console.log(index);
      console.log(this.theloais);
      var x: any = {maTheLoai: this.theloais.maTheLoai}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/TheLoai/Delete-MaTheLoai', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchTheLoai(1);
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
