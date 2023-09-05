// import 'package:boat_booking/config/themes/app_colors.dart';
// import 'package:boat_booking/data/datasource/server/linkapi.dart';
// import 'package:boat_booking/data/handling/handling_data_view.dart';
// import 'package:boat_booking/domain/controller/settings/settings_controller.dart';
// import 'package:boat_booking/screens/widgets/animation/custom_animation.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
// import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
// import 'package:boat_booking/screens/widgets/consts/widget/custom_card.dart';
// import 'package:boat_booking/utils/bloc/cubit.dart';
// import 'package:boat_booking/utils/bloc/states.dart';
// import 'package:boat_booking/utils/constants/save_mode.dart';
// import 'package:boat_booking/utils/constants/shared_service.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:get/get.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     bool isDarkModeEnabled =
//         sharedService.sharedPref.getBool('isDark') ?? false;
//     Get.put(SettingsControllerImp());

//     return BlocConsumer<AppCubit, AppStates>(
//       listener: (context, state) {},
//       builder: (context, state) => Scaffold(
//           backgroundColor:
//               isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
//           appBar: AppBar(
//             centerTitle: true,
//             elevation: 0,
//             foregroundColor: AppColors.lightColor,
//             backgroundColor:
//                 isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
//             title: CustomAnimation(
//                 millisecond: 50,
//                 widget: CustomTextStyle(
//                   fontSize: 20,
//                   title: '3'.tr,
//                 )),
//           ),
//           body: GetBuilder<SettingsControllerImp>(
//               builder: (controller) => HandlingDataView(
//                     statusRequest: controller.statusRequest,
//                     widget: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: ListView.builder(
//                           itemCount: 1,
//                           physics: const BouncingScrollPhysics(),
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) => Column(children: [
//                                 const SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   margin: const EdgeInsets.only(top: 5),
//                                   child: Column(
//                                     children: <Widget>[
//                                       Card(
//                                         elevation: 2,
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(100),
//                                         ),
//                                         color: Colors.grey.shade500,
//                                         child: Container(
//                                           width: 150,
//                                           height: 150,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(100),
//                                             border: Border.all(
//                                               color: Colors.grey.shade500,
//                                               width: 6.0,
//                                             ),
//                                           ),
//                                           child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(80),
//                                               child: CachedNetworkImage(
//                                                   imageUrl:
//                                                       '${ServerLink.linkImageUser}/${myHive!.get('userData')['image']}',
//                                                   width: 80,
//                                                   height: 80,
//                                                   fit: BoxFit.fill)),
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         height: 20,
//                                       ),
//                                       CustomTextStyle(
//                                           title:
//                                               '${myHive!.get('userData')['username']}',
//                                           fontSize: 25),
//                                       const SizedBox(
//                                         height: 10,
//                                       ),
//                                       CustomTextCuption(
//                                           title:
//                                               '${myHive!.get('userData')['email']}',
//                                           fontSize: 15),
//                                     ],
//                                   ),
//                                 ),

//                                 const SizedBox(
//                                   height: 30,
//                                 ),

//                                 CustomCard(
//                                   widget: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ListTile(
//                                         leading: Icon(Icons.person,
//                                             size: 30,
//                                             color: isDarkModeEnabled
//                                                 ? AppColors.greyColor
//                                                 : AppColors.kSecondaryColor),
//                                         title: CustomTextStyle(
//                                             title: '4'.tr, fontSize: 15),
//                                         subtitle: CustomTextCuption(
//                                             title:
//                                                 '${myHive!.get('userData')['username']}',
//                                             fontSize: 13),
//                                         trailing: Icon(
//                                             Icons.keyboard_arrow_right,
//                                             color: isDarkModeEnabled
//                                                 ? AppColors.greyColor
//                                                 : AppColors.kSecondaryColor),
//                                         onTap: () {
//                                           // controller.goToEditUser(
//                                           //     controller.data[index]);
//                                         }),
//                                   ),
//                                 ),

//                                 const SizedBox(
//                                   height: 15,
//                                 ),
//                                 CustomCard(
//                                   widget: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ListTile(
//                                         leading: Icon(Icons.language,
//                                             size: 30,
//                                             color: isDarkModeEnabled
//                                                 ? AppColors.greyColor
//                                                 : AppColors.kSecondaryColor),
//                                         title: CustomTextStyle(
//                                             title: '2'.tr, fontSize: 15),
//                                         subtitle: CustomTextCuption(
//                                             title: '10'.tr, fontSize: 13),
//                                         trailing: Icon(
//                                             Icons.keyboard_arrow_right,
//                                             color: isDarkModeEnabled
//                                                 ? AppColors.greyColor
//                                                 : AppColors.kSecondaryColor),
//                                         onTap: () {
//                                           controller.goToChangeLanguage();
//                                         }),
//                                   ),
//                                 ),

//                                 const SizedBox(
//                                   height: 15,
//                                 ),

//                                 CustomCard(
//                                   widget: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: ListTile(
//                                       leading: Icon(Icons.dark_mode,
//                                           size: 30,
//                                           color: isDarkModeEnabled
//                                               ? AppColors.greyColor
//                                               : AppColors.kSecondaryColor),
//                                       title: CustomTextStyle(
//                                           title: '6'.tr, fontSize: 15),
//                                       subtitle: CustomTextCuption(
//                                           title: isDarkModeEnabled
//                                               ? '7'.tr
//                                               : '8'.tr,
//                                           fontSize: 13),
//                                       trailing: IconButton(
//                                           icon: Icon(
//                                             isDarkModeEnabled
//                                                 ? Icons.wb_sunny
//                                                 : CupertinoIcons.moon_stars,
//                                             color: isDarkModeEnabled
//                                                 ? Colors.yellow
//                                                 : AppColors.kSecondaryColor,
//                                             size: 30,
//                                           ),
//                                           onPressed: () {
//                                             isDarkModeEnabled =
//                                                 !isDarkModeEnabled;
//                                             sharedService.sharedPref.setBool(
//                                                 'isDark', isDarkModeEnabled);
//                                             AppCubit.get(context)
//                                                 .changeThemeMode(
//                                                     fromShared:
//                                                         isDarkModeEnabled);
//                                             AppCubit().changeThemeMode(
//                                                 fromShared: isDarkModeEnabled);
//                                           }
//                                           //}
//                                           ),
//                                       onTap: () {
//                                         isDarkModeEnabled = !isDarkModeEnabled;
//                                         sharedService.sharedPref.setBool(
//                                             'isDark', isDarkModeEnabled);
//                                         AppCubit.get(context).changeThemeMode(
//                                             fromShared: isDarkModeEnabled);

//                                         AppCubit().changeThemeMode(
//                                             fromShared: isDarkModeEnabled);
//                                       },
//                                     ),
//                                   ),
//                                 ),

//                                 const SizedBox(
//                                   height: 20,
//                                 ),

//                                 CustomCard(
//                                     widget: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: ListTile(
//                                     leading: Icon(Icons.logout,
//                                         size: 30,
//                                         color: isDarkModeEnabled
//                                             ? AppColors.greyColor
//                                             : AppColors.kSecondaryColor),
//                                     title: CustomTextStyle(
//                                         title: '9'.tr, fontSize: 15),
//                                     trailing: Icon(Icons.keyboard_arrow_right,
//                                         color: isDarkModeEnabled
//                                             ? AppColors.greyColor
//                                             : AppColors.kSecondaryColor),
//                                     onTap: () {
//                                       // logOutDialogWidget(context);
//                                     },
//                                   ),
//                                 )),

//                                 // ]);
//                                 const SizedBox(
//                                   height: 15,
//                                 )
//                               ])),
//                     ),
//                   ))),
//     );
//   }
// }
