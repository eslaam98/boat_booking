import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response =
        await crud.postData(ServerLink.checkEmailLink, {"user_email": email});
    return response.fold((l) => l, (r) => r);
  }
}
