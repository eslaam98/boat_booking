import 'dart:io';

import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class EditUserData {
  Crud crud;
  EditUserData(this.crud);
  postdata(
    String userId,
    String username,
    String phone,
    String imageProfileName,
    File? imageProfileFile,
  ) async {
    var response = await crud.postDataWithImage(
        ServerLink.editUserLink,
        {
          "user_id": userId,
          "username": username,
          "user_phone": phone,
          "user_image": imageProfileName,
        },
        imageProfileFile!);
    return response.fold((l) => l, (r) => r);
  }

  postdataWithoutImage(
      String userId, String username, String phone, String imageName) async {
    var response = await crud.postData(
      ServerLink.editUserLink,
      {
        "user_id": userId,
        "username": username,
        "user_phone": phone,
        "user_image": imageName,
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
