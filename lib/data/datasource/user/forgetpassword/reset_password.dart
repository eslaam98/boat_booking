import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(ServerLink.ressetPasswordLink,
        {"user_email": email, "user_password": password});
    return response.fold((l) => l, (r) => r);
  }
}
