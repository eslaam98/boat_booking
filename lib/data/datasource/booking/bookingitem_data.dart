import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class BookingItemData {
  Crud crud;
  BookingItemData(this.crud);
  postdata(
      String orderPrice,
      String orderTotalPeople,
      String orderDate,
      String orderTime,
      String orderMSG,
      String orderDiscount,
      String orderItemId,
      String orderUserId,
      String orderOnerId,
      String orderItemImage) async {
    var response = await crud.postData(ServerLink.bookingItemLink, {
      "order_price": orderPrice,
      "order_total_people": orderTotalPeople,
      "order_date": orderDate,
      "order_time": orderTime,
      "order_msg": orderMSG,
      "order_discount": orderDiscount,
      "order_itemid": orderItemId,
      "order_userid": orderUserId,
      "order_onerid": orderOnerId,
      "order_itemimage": orderItemImage
    });
    return response.fold((l) => l, (r) => r);
  }

  getItemBooked(String userId) async {
    var response =
        await crud.postData(ServerLink.itemBookedLink, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
