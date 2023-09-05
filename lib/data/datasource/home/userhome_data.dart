import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getdata() async {
    var response = await crud.postData(ServerLink.homeLink, {});
    return response.fold((l) => l, (r) => r);
  }

  getMostItems() async {
    var response = await crud.postData(ServerLink.mostItemsLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
