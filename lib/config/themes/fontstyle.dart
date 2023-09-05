import 'package:boat_booking/utils/constants/save_mode.dart';

class AppFontStyle {
  static String fontStyle =
      sharedService.sharedPref.getString('language') == 'en'
          ? 'Open Sans'
          : 'El Messiri';
}
