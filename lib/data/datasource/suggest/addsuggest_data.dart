import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class AddSuggestData {
  Crud crud;
  AddSuggestData(this.crud);
  postdata(
    String userId,
    String userName,
    String userPhone,
    String suggestType,
    String suggestDesc,
  ) async {
    var response = await crud.postData(
      ServerLink.addSuggestLink,
      {
        "suggest_userid": userId,
        "suggest_username": userName,
        "suggest_userphone": userPhone,
        "suggest_type": suggestType,
        "suggest_desc": suggestDesc,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
