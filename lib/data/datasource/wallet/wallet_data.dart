import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class WalletData {
  Crud crud;
  WalletData(this.crud);
  getData(
    String walletUserId,
  ) async {
    var response = await crud.postData(
      ServerLink.walletLink,
      {
        "wallet_userid": walletUserId,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
