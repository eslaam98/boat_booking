import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Box? myHive;

class SharedService extends GetxService {
  Future<Box> hiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  late SharedPreferences sharedPref;
  Future<SharedService> init() async {
    await Firebase.initializeApp();
    WidgetsFlutterBinding.ensureInitialized();

    //await FilePicker.platform;
    sharedPref = await SharedPreferences.getInstance();
    myHive = await hiveBox("shaleeh");
    await Jiffy.locale('ar');
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => SharedService().init());
}
