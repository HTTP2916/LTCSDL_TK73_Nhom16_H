import { Component, OnInit, Inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
declare var $: any

@Component({
  selector: 'app-baihat',
  templateUrl: './baihat.component.html',
  styleUrls: ['./baihat.component.css']
})
export class BaihatComponent implements OnInit {

  public lstBaiHat:[];
  
  BH: any = {
    Table:[],
    data:[],
    totalRecord:0,
    page:0,
    size:5,
    TotalPage:0
  }
  baihat:any={
    maBaiHat: "gg",
    maCaSi: "101",
    maTheLoai: "TL101",
    tenBaiHat: "say",
    quocGia: "h",
    fileLoiBaiHat: "h",
    linkNhac: "h",
    ngayTao: "6",
    nguoiTao: "TP01",
    ngayChinhSua: "6",
    nguoiChinhSua: "TP01",
    ghiChu: "t"
  }
  isEdit: boolean = true;
  constructor( private http: HttpClient, @Inject('BASE_URL') baseUrl: string) {
    
  }

  ngOnInit() {
    this.SearchBaiHat(1);
  }
  SearchBaiHat(cPage){
    let x = {
      page: cPage,
      size:5,
      keyword:""
    }
    this.http.post('https://localhost:44332/' + 'api/BaiHat/SearchBaiHat',x).subscribe(result => {
      this.BH = result;
      this.BH = this.BH.data;
    }, error => console.error(error));
  }
  SearchNext(){
    if(this.BH.page < this.BH.totalPage){
      let nextPage = this.BH.page + 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/BaiHat/SearchBaiHat',x).subscribe(result => {
      this.BH = result;
      this.BH = this.BH.data;
    }, error => console.error(error));
    }
    else{
      alert("Ban dang o vi tri cuoi cung")
    }
  }

  SearchPrevious(){
    if(this.BH.page >1 ){
      let nextPage = this.BH.page - 1;
      let x = {
        page: nextPage,
        size:5,
        keyword:""
      }
      this.http.post('https://localhost:44332/' + 'api/BaiHat/SearchBaiHat',x).subscribe(result => {
      this.BH = result;
      this.BH = this.BH.data;
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
      this.baihat = {
        maBaiHat: "",
        maCaSi: "",
        maTheLoai: "",
        tenBaiHat: "",
        quocGia: "",
        fileLoiBaiHat: "",
        linkNhac: "",
        ngayTao: "",
        nguoiTao: "",
        ngayChinhSua: "",
        nguoiChinhSua: "",
        ghiChu: ""
      }
    }
    else{
      this.isEdit = true;
      this.baihat = index;
    }
    $('#exampleModal').modal("show");
  }
  addBaiHat()
  {
    var x = this.baihat;
    this.http.post('https://localhost:44332/' + 'api/BaiHat/create-baihat',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.baihat = r.data;
        this.isEdit = true;
        this.SearchBaiHat(1);
        confirm("Thêm bài hát thành công");
      }
    }, error => console.error(error));
  }
  UpdateBaiHat()
  {
    var x = this.baihat;
    this.http.post('https://localhost:44332/' + 'api/BaiHat/update-baihat',x).subscribe(result => {
      var r: any = result;
      if ( r.success )
      {
        this.baihat = r.data;
        this.isEdit = true;
        this.SearchBaiHat(1);
        confirm("Cập nhật thành công");
      }
    }, error => console.error(error));
  }

  deleteBaiHat(index) {
    var r = confirm("Bạn có chắc chắn muốn xóa dữ liệu này?");
    if (r == true) {
      this.baihat = index;
      //this.baihat = this.BH.Table[index];
      console.log(index);
      console.log(this.baihat);
      var x = {id: this.baihat.maBaiHat}; 
      console.log(x);
      this.http.post('https://localhost:44332/' + 'api/BaiHat/Delete-MaBaiHat', x).subscribe(result => {
        var res: any = result;
        if (res.success) {
          this.SearchBaiHat(1);
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