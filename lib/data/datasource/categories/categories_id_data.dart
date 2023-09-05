import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class CategoriesIdData {
  Crud crud;
  CategoriesIdData(this.crud);
  getData(
    String categoriesId,
  ) async {
    var response = await crud.postData(ServerLink.viewCategoriesIdLink, {
      'item_category_id': categoriesId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  onerCategories(String categoriesId, String onerId) async {
    var response = await crud.postData(ServerLink.viewOnerCategoriesLink, {
      'item_category_id': categoriesId.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
