import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class AddWalletData {
  Crud crud;
  AddWalletData(this.crud);
  postdata(
    String walletPrice,
    String walletUserId,
    String walletDetails,
  ) async {
    var response = await crud.postData(
      ServerLink.addWalletLink,
      {
        "wallet_price": walletPrice,
        "wallet_userid": walletUserId,
        "wallet_details": walletDetails,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
