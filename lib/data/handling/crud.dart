import 'dart:io';

import 'package:boat_booking/data/handling/chech_internet.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class Crud {
  Future<Either<StatusRequest, Map>> postData(
    String linkurl,
    Map data,
  ) async {
    if (await checkInternet()) {
      var response = await http.post(
        Uri.parse(linkurl), body: data,

        // headers: {'Accept': 'application/json'}
      );
      if (kDebugMode) {
        print('r1 ${response.statusCode}');
      }
      // if (kDebugMode) {
      //   print('r2 ${response.body}');
      // }
      // if (kDebugMode) {
      //   print('r3 ${response.headers}');
      // }
      if (kDebugMode) {
        print('r4 $response');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        return Right(responsebody);
      } else {
        if (kDebugMode) {
          print(response.body);
        }
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postDataWithImage(
      String linkurl, Map data, File file) async {
    if (await checkInternet()) {
      var request = http.MultipartRequest('Post', Uri.parse(linkurl));
      var length = await file.length();
      var stream = http.ByteStream(file.openRead());
      var multipartFile = http.MultipartFile('file', stream, length,
          filename: path.basename(file.path));
      //  basename(file.path));
      request.files.add(multipartFile);
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);

      if (kDebugMode) {
        print('r1 ${response.statusCode}');
      }
      // if (kDebugMode) {
      //   print('r2 ${response.body}');
      // }
      // if (kDebugMode) {
      //   print('r3 ${response.headers}');
      // }
      if (kDebugMode) {
        print('r4 $response');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postDataWithImages(
      String linkurl, Map data, File image, List<File> files) async {
    if (await checkInternet()) {
      var request = http.MultipartRequest('POST', Uri.parse(linkurl));
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      var lengthd = await image.length();
      var streamd = http.ByteStream(image.openRead());
      var multipartFiled = http.MultipartFile('file', streamd, lengthd,
          filename: path.basename(image.path));
      //  basename(file.path));
      request.files.add(multipartFiled);
      for (var i = 0; i < files.length; i++) {
        var file = files[i];
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile('files[]', stream, length,
            filename: path.basename(file.path));
        request.files.add(multipartFile);
      }
      var myrequest = await request.send();
      var response = await http.Response.fromStream(myrequest);

      if (kDebugMode) {
        print('r1 ${response.statusCode}');
      }
      if (kDebugMode) {
        print('r2 ${response.body}');
      }
      if (kDebugMode) {
        print('r3 ${response.headers}');
      }
      if (kDebugMode) {
        print('r4 $response');
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  postRequestWithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest('Post', Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(file.path));
    //  basename(file.path));
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myrequest = await request.send();
    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      if (kDebugMode) {
        print('Error ${myrequest.statusCode}');
      }
    }
  }
}
