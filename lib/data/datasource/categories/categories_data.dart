import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(ServerLink.viewCategoriesLink, {});
    return response.fold((l) => l, (r) => r);
  }
}
