import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';
import 'package:boat_booking/utils/constants/save_mode.dart';

class UserAccountData {
  Crud crud;
  UserAccountData(this.crud);
  getdata() async {
    var response = await crud.postData(ServerLink.userAccountLink,
        {"user_id": sharedService.sharedPref.getString('user_id').toString()});
    return response.fold((l) => l, (r) => r);
  }
}
