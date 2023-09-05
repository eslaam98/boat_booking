import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class ChangePassData {
  Crud crud;
  ChangePassData(this.crud);
  postdata(String oldPassword, String newPassword, String userId) async {
    var response = await crud.postData(ServerLink.changPasswordLink, {
      "user_id": userId,
      "user_password": oldPassword,
      "new_password": newPassword,
    });
    return response.fold((l) => l, (r) => r);
  }
}
