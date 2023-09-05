import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email, String password) async {
    var response = await crud.postData(
        ServerLink.logInLink, {"user_email": email, "user_password": password});
    return response.fold((l) => l, (r) => r);
  }
}
