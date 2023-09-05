import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email, String verfiyCode) async {
    var response = await crud.postData(ServerLink.verifyCodeLink,
        {"user_email": email, "user_verfiycode": verfiyCode});
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response =
        await crud.postData(ServerLink.resindCodeLink, {"user_email": email});
    return response.fold((l) => l, (r) => r);
  }
}
