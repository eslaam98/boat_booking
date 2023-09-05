import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);
  getdata(String userId, String orderApprove) async {
    var response = await crud.postData(ServerLink.ordersLink,
        {"user_id": userId, "order_approve": orderApprove});
    return response.fold((l) => l, (r) => r);
  }
}
