import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class VerfiyCodeSignUpData {
  Crud crud;
  VerfiyCodeSignUpData(this.crud);
  postdata(String email, String verfiyCode) async {
    var response = await crud.postData(ServerLink.verifyCodeSignUpLink, {
      'user_email': email,
      'user_verfiycode': verfiyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response =
        await crud.postData(ServerLink.resindCodeLink, {"user_email": email});
    return response.fold((l) => l, (r) => r);
  }
}
