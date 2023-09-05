// import 'package:boat_booking/config/themes/app_colors.dart';
// import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_card.dart';
// import 'package:boat_booking/utils/constants/local_controller.dart';
// import 'package:boat_booking/utils/constants/save_mode.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// class ChooseLanguagePage extends GetView<LocalController> {
//   const ChooseLanguagePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isDarkModeEnabled =
//         sharedService.sharedPref.getBool('isDark') ?? false;
//     return Scaffold(
//       backgroundColor:
//           isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         foregroundColor:
//             isDarkModeEnabled ? AppColors.lightColor : AppColors.darkColor,
//         backgroundColor:
//             isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
//         title: CustomAnimation(
//             millisecond: 2000,
//             widget: CustomTextStyle(
//               title: "2".tr,
//               fontSize: 18,
//             )),
//       ),
//       body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: ListView(children: [
//             Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//               const SizedBox(
//                 height: 25,
//               ),
//               /////New Edit here11111111111111111111111111111111111111111111

//               CustomTextCuption(
//                 title: '1'.tr,
//                 fontSize: 20,
//               ),
//               const SizedBox(
//                 height: 85,
//               ),
//               CustomCard(
//                 widget: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                       leading: const Icon(
//                         Icons.language,
//                         size: 30,
//                       ),
//                       title: const CustomTextStyle(
//                           title: 'English Language', fontSize: 15),
//                       subtitle: const CustomTextCuption(
//                           title: 'English', fontSize: 13),
//                       trailing: Icon(Icons.language_outlined,
//                           color: isDarkModeEnabled
//                               ? Colors.white
//                               : Colors.transparent.withOpacity(0.6)),
//                       onTap: () {
//                         controller.changeLang('en');
//                       }),
//                 ),
//               ),

//               const SizedBox(
//                 height: 25,
//               ),
//               CustomCard(
//                 widget: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListTile(
//                       leading: const Icon(
//                         Icons.language,
//                         size: 30,
//                       ),
//                       title: const CustomTextStyle(
//                           title: 'اللغة العربية', fontSize: 15),
//                       subtitle: const CustomTextCuption(
//                           title: 'العربية', fontSize: 13),
//                       trailing: Icon(Icons.language_outlined,
//                           color: isDarkModeEnabled
//                               ? Colors.white
//                               : Colors.transparent.withOpacity(0.6)),
//                       onTap: () {
//                         controller.changeLang('ar');
//                       }),
//                 ),
//               ),
//             ]),
//           ])),
//     );
//   }
// }
