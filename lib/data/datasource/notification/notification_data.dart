import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);
  getData(String userId) async {
    var response =
        await crud.postData(ServerLink.notificationLink, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }

  makeNotificationAsRead(String id) async {
    var response =
        await crud.postData(ServerLink.makeNotificationAsReadLink, {"id": id});
    return response.fold((l) => l, (r) => r);
  }

  // getNotiCount(String userId) async {
  //   var response =
  //       await crud.postData(AppLink.linkGetNotiCount, {"user_id": userId});
  //   return response.fold((l) => l, (r) => r);
  // }
}
