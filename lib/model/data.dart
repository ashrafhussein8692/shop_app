// import 'data.dart';
//
// /// current_page : 1
// /// data : [{"id":35,"name":"افضل العروض","image":"https://student.valuxapps.com/storage/uploads/categories/161950183360VJK.best-offer-sale-banner-vector.jpg"},{"id":20,"name":"إلكترونيات","image":"https://student.valuxapps.com/storage/uploads/categories/1618882951tlW17.jelec.png"},{"id":36,"name":"مكافحة كورونا","image":"https://student.valuxapps.com/storage/uploads/categories/1620252583PBo9f.2515-2050_l.png"},{"id":26,"name":"سوبر ماركت","image":"https://student.valuxapps.com/storage/uploads/categories/1618883074tPenb.super.png"},{"id":23,"name":"ألعاب","image":"https://student.valuxapps.com/storage/uploads/categories/1618883450k3M7u.toys.png"},{"id":21,"name":"رياضة","image":"https://student.valuxapps.com/storage/uploads/categories/1618883220mfCzZ.sports.png"},{"id":27,"name":"اغذيه ومأكولات طازجه","image":"https://student.valuxapps.com/storage/uploads/categories/1619502074w3Zie.rau-cu-qua.png"},{"id":28,"name":"الجوالات","image":"https://student.valuxapps.com/storage/uploads/categories/16188818430X9HL.mobiles.png"},{"id":22,"name":"الأمهات و الأطفال","image":"https://student.valuxapps.com/storage/uploads/categories/1615410392yMTiT.mom-baby-620.jpeg"},{"id":30,"name":"اجهزة الحاسوب","image":"https://student.valuxapps.com/storage/uploads/categories/1618882598N1fY8.lap.png"},{"id":33,"name":"إكسسورات","image":"https://student.valuxapps.com/storage/uploads/categories/1620606629L48c8.download (5).jpg"},{"id":32,"name":"المطبخ","image":"https://student.valuxapps.com/storage/uploads/categories/1618882686kdWs3.kit.png"},{"id":24,"name":"أجهزة منزلية","image":"https://student.valuxapps.com/storage/uploads/categories/1618882488Cg3GE.applia.png"}]
// /// first_page_url : "https://student.valuxapps.com/api/categories?page=1"
// /// from : 1
// /// last_page : 1
// /// last_page_url : "https://student.valuxapps.com/api/categories?page=1"
// /// next_page_url : null
// /// path : "https://student.valuxapps.com/api/categories"
// /// per_page : 35
// /// prev_page_url : null
// /// to : 13
// /// total : 13
//
// class Data {
//   int? currentPage;
//   List<Data>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   dynamic? nextPageUrl;
//   String? path;
//   int? perPage;
//   dynamic? prevPageUrl;
//   int? to;
//   int? total;
//
//   Data({
//       this.currentPage,
//       this.data,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.nextPageUrl,
//       this.path,
//       this.perPage,
//       this.prevPageUrl,
//       this.to,
//       this.total});
//
//   Data.fromJson(dynamic json) {
//     currentPage = json["current_page"];
//     if (json["data"] != null) {
//       data = [];
//       json["data"].forEach((v) {
//         data?.add(Data.fromJson(v));
//       });
//     }
//     firstPageUrl = json["first_page_url"];
//     from = json["from"];
//     lastPage = json["last_page"];
//     lastPageUrl = json["last_page_url"];
//     nextPageUrl = json["next_page_url"];
//     path = json["path"];
//     perPage = json["per_page"];
//     prevPageUrl = json["prev_page_url"];
//     to = json["to"];
//     total = json["total"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["current_page"] = currentPage;
//     if (data != null) {
//       map["data"] = data?.map((v) => v.toJson()).toList();
//     }
//     map["first_page_url"] = firstPageUrl;
//     map["from"] = from;
//     map["last_page"] = lastPage;
//     map["last_page_url"] = lastPageUrl;
//     map["next_page_url"] = nextPageUrl;
//     map["path"] = path;
//     map["per_page"] = perPage;
//     map["prev_page_url"] = prevPageUrl;
//     map["to"] = to;
//     map["total"] = total;
//     return map;
//   }
//
// }