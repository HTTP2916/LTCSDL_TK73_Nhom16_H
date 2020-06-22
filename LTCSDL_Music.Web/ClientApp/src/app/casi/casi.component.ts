import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-casi',
  templateUrl: './casi.component.html',
  styleUrls: ['./casi.component.css']
})
export class CasiComponent implements OnInit {
  
  casi: any = {
    
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  casis:any={
    maCaSi: "CS02",
    tenCaSi: "TP",
    gioiTinh: "Nữ",
    quocTich: "Việt Nam",
    hinhAnh: "null",
    ghiChu: "h"
  }
  isEdit: boolean = true;
  constructor(private http: HttpClient, @Inject('BASE_URL') baseUrl: string) { }

  ngOnInit() {
    this.SearchCaSi(1);
  }
  SearchCaSi(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/CaSi/SearchCaSi',x).subscribe(result => {
      this.casi = result;
      this.casi = this.casi.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.casi.page < this.casi.totalPage){
      let nextPage = this.casi.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/CaSi/SearchCaSi',x).subscribe(result => {
      this.casi = result;
      this.casi = this.casi.data;
    }, error => console.error(error));
    }
    else{
      alert("Ban dang o vi tri cuoi cung")
    }
  }

  SearchPrevious(){
    if(this.casi.page >1 ){
      let nextPage = this.casi.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/CaSi/SearchCaSi',x).subscribe(result => {
      this.casi = result;
      this.casi = this.casi.data;
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
      this.casis = {
        maCaSi: "",
        tenCaSi: "",
        gioiTinh: "",
        quocTich: "",
        hinhAnh: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.casis = index;
    }
    $('#exampleModal').modal("show");
  }
  addCaSi()
  {
    var x = this.casis;
    this.http.post('https://localhost:44332/' + 'api/CaSi/create-casi',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.casis = r.data;
        this.isEdit = true;
        this.SearchCaSi(1);
        confirm("Thêm ca sĩ thành công");
      }
    }, error => console.error(error));
  }
  UpdateCaSi()
  {
    var x = this.casis;
    this.http.post('https://localhost:44332/' + 'api/CaSi/update-casi',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.casis = r.data;
        this.isEdit = true;
        this.SearchCaSi(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteCasi(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.casis = this.casi.data[index];
      //this.baihat = this.BH.Table[index];
      
      var x: any = {MaCaSi: this.casis.maCaSi}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/CaSi/Delete-MaCaSi', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchCaSi(1);
          alert("Xóa thành công!");
        }
        else {
          alert(res.message);
        }
      }, error => console.error(error));
    }
  }
}
