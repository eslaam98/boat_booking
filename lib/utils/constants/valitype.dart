import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "ليس اسم مستخدم";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "من فضلك ادخل بريد صحيح";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "من فضلك ادخل رقم هاتف";
    }
  }
  if (type == "Link") {
    if (!GetUtils.isURL(val)) {
      return "من فضلك ادخل الموقع علي الخريطة";
    }
  }
  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "من فضلك ادخل رقم صحيح";
    }
  }
  if (val.isEmpty) {
    return "لا يمكن ان يكون الحقل فارغ";
  }

  if (val.length < min) {
    return "لا يمكن ان يكون اقل من $min";
  }

  if (val.length > max) {
    return "لايمكن ان تكون القيمة اكبر من $max";
  }
}
