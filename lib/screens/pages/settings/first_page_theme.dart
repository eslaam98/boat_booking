// import 'package:boat_booking/config/themes/app_colors.dart';
// import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
// import 'package:boat_booking/screens/widgets/onboarding/first_screen_list.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_card.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_snackwidget.dart';
// import 'package:boat_booking/utils/bloc/cubit.dart';
// import 'package:boat_booking/utils/bloc/states.dart';
// import 'package:boat_booking/utils/constants/local_controller.dart';
// import 'package:boat_booking/utils/constants/save_mode.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:get/get.dart';

// class FirstPageTheme extends GetView<LocalController> {
//   const FirstPageTheme({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     bool isDarkModeEnabled =
//         sharedService.sharedPref.getBool('isDark') ?? false;

//     return BlocConsumer<AppCubit, AppStates>(
//         listener: (context, state) {},
//         builder: (context, state) => Scaffold(
//               backgroundColor: isDarkModeEnabled
//                   ? AppColors.darkColor
//                   : AppColors.lightColor,
//               appBar: AppBar(
//                 centerTitle: true,
//                 backgroundColor: isDarkModeEnabled
//                     ? AppColors.darkColor
//                     : AppColors.lightColor,
//                 elevation: 0,
//                 title: const CustomTextStyle(
//                   title: 'الاعدادات الافتراضية للتطبيق',
//                   fontSize: 15,
//                 ),
//               ),
//               body: ListView(padding: const EdgeInsets.all(15), children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 const ListTile(
//                     title: CustomTextStyle(
//                   title: 'Choose App Theme',
//                   textAlign: TextAlign.center,
//                 )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomCard(
//                   widget: ListTile(
//                     title: const CustomTextStyle(
//                       title: 'Dark Mode | الوضع المظلم',
//                       fontSize: 17,
//                       textAlign: TextAlign.center,
//                     ),
//                     subtitle: CustomTextCuption(
//                       title: isDarkModeEnabled ? 'ON | مفعل' : 'Off | مغلق',
//                       textAlign: TextAlign.center,
//                     ),
//                     //   }

//                     onTap: () {
//                       isDarkModeEnabled = !isDarkModeEnabled;
//                       sharedService.sharedPref
//                           .setBool('isDark', isDarkModeEnabled);
//                       AppCubit.get(context)
//                           .changeThemeMode(fromShared: isDarkModeEnabled);
//                       AppCubit().changeThemeMode(fromShared: isDarkModeEnabled);

//                       controller.currentPage = 1;
//                     },
//                     trailing: IconButton(
//                         icon: Icon(
//                           isDarkModeEnabled
//                               ? Icons.wb_sunny
//                               : Icons.brightness_2,
//                           color: isDarkModeEnabled
//                               ? Colors.yellow
//                               : AppColors.greyColor,
//                           size: 30,
//                         ),
//                         onPressed: () {}),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 const ListTile(
//                     title: CustomTextStyle(
//                   title: 'Choose App Language',
//                   textAlign: TextAlign.center,
//                 )),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 CustomCard(
//                   widget: ListTile(
//                     title: Text(
//                       'اللغة العربية',
//                       style: TextStyle(
//                           fontFamily: 'Open Sans',
//                           color: isDarkModeEnabled
//                               ? Colors.white
//                               : Colors.transparent.withOpacity(0.6),
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     subtitle: Text(
//                       'Arabic',
//                       style: TextStyle(
//                         fontFamily: 'Open Sans',
//                         color: isDarkModeEnabled
//                             ? Colors.grey
//                             : Colors.transparent.withOpacity(0.6),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     trailing: Icon(Icons.language_outlined,
//                         color: isDarkModeEnabled
//                             ? Colors.white
//                             : Colors.transparent.withOpacity(0.6)),
//                     onTap: () {
//                       controller.changeLang('ar');
//                       controller.currentPage = 2;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomCard(
//                   widget: ListTile(
//                     title: Text(
//                       'English Language',
//                       style: TextStyle(
//                           fontFamily: 'Open Sans',
//                           color: isDarkModeEnabled
//                               ? Colors.white
//                               : Colors.transparent.withOpacity(0.6),
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                     subtitle: Text(
//                       'الانجليزية',
//                       style: TextStyle(
//                         fontFamily: 'Open Sans',
//                         color: isDarkModeEnabled
//                             ? Colors.grey
//                             : Colors.transparent.withOpacity(0.6),
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     trailing: Icon(Icons.language_outlined,
//                         color: isDarkModeEnabled
//                             ? Colors.white
//                             : Colors.transparent.withOpacity(0.6)),
//                     onTap: () {
//                       controller.changeLang('en');
//                       controller.currentPage = 2;
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 60,
//                 ),
//                 CustomButton(
//                   title: '26'.tr,
//                   onPressed: () {
//                     if (controller.currentPage! >
//                         firstScreenSettingsList.length - 1) {
//                       sharedService.sharedPref.setString("step", "1");
//                       // Get.offAllNamed(AppRoute.onBoardingPage);

//                       if (kDebugMode) {
//                         print(sharedService.sharedPref.getString("step"));
//                       }
//                     } else {
//                       CustomSnackWidget.appErrorSnack(
//                           context, 'Please Choose Settings');
//                     }
//                   },
//                 )
//               ]),
//             ));
//   }
// }
