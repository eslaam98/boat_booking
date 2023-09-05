import 'dart:io';

import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/crud.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(
    String username,
    String email,
    String phone,
    String password,
    String imageProfileName,
    File? imageProfileFile,
  ) async {
    var response = await crud.postDataWithImage(
        ServerLink.signUpLink,
        {
          "username": username,
          "user_email": email,
          "user_phone": phone,
          "user_password": password,
          'user_image': imageProfileName,
        },
        imageProfileFile!);
    return response.fold((l) => l, (r) => r);
  }
}
