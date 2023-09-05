import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);

  searchData(String search) async {
    var response =
        await crud.postData(ServerLink.searchLink, {"search": search});
    return response.fold((l) => l, (r) => r);
  }

  searchWithFilterData(
    String search,
    String startPrice,
    String endPrice,
    String itemCatId,
    String itemStars,
  ) async {
    var response = await crud.postData(ServerLink.searchWithFilterLink, {
      "search": search,
      "item_price_start": startPrice,
      "item_price_end": endPrice,
      "item_category_id": itemCatId,
      "item_stars": itemStars,
    });
    return response.fold((l) => l, (r) => r);
  }
}
