// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:hotels_app/config/router/app_image.dart';
// import 'package:hotels_app/config/themes/app_colors.dart';
// import 'package:hotels_app/utils/constants/save_mode.dart';
// import 'package:hotels_app/view/widgets/consts/text/custom_text_cuption.dart';
// import 'package:hotels_app/view/widgets/consts/text/custom_textstyle.dart';
// import 'package:hotels_app/view/widgets/consts/widget/logout_widget.dart';
// import 'package:iconsax/iconsax.dart';

// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({
//     required this.screenIndex,
//     required this.iconAnimationController,
//     required this.callBackIndex,
//     super.key,
//   });

//   final AnimationController iconAnimationController;
//   final DrawerIndex screenIndex;
//   final Function(DrawerIndex) callBackIndex;

//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   late final List<DrawerList> drawerList;
//   @override
//   void initState() {
//     super.initState();
//     setDrawerListArray();
//   }

//   void setDrawerListArray() {
//     drawerList = <DrawerList>[
//       DrawerList(
//         index: DrawerIndex.home,
//         labelName: '32'.tr,
//         icon: const Icon(Icons.home_filled),
//       ),
//       DrawerList(
//         index: DrawerIndex.help,
//         labelName: 'الطلبات المكتملة',
//         icon: const Icon(Iconsax.money_tick),
//       ),
//       DrawerList(
//         index: DrawerIndex.feedback,
//         labelName: '109'.tr,
//         icon: const Icon(Iconsax.support5),
//       ),
//       DrawerList(
//         index: DrawerIndex.invite,
//         labelName: '35'.tr,
//         icon: const Icon(Iconsax.setting_2),
//       ),
//       DrawerList(
//         index: DrawerIndex.about,
//         labelName: 'About',
//         icon: const Icon(Iconsax.information),
//       ),
      
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool isDarkModeEnabled =
//         sharedService.sharedPref.getBool('isDark') ?? false;
//     return Scaffold(
//       body: Container(
//         color: isDarkModeEnabled ? AppColors.darkColor : AppColors.lightColor,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.only(top: 40.0),
//               child: Container(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     AnimatedBuilder(
//                       animation: widget.iconAnimationController,
//                       builder: (BuildContext context, _) {
//                         return ScaleTransition(
//                           scale: AlwaysStoppedAnimation<double>(1.0 -
//                               (widget.iconAnimationController.value) * 0.2),
//                           child: RotationTransition(
//                             turns: AlwaysStoppedAnimation<double>(Tween<double>(
//                                         begin: 0.0, end: 24.0)
//                                     .animate(CurvedAnimation(
//                                         parent: widget.iconAnimationController,
//                                         curve: Curves.fastOutSlowIn))
//                                     .value /
//                                 360),
//                             child: Container(
//                                 height: 120,
//                                 width: 120,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   boxShadow: <BoxShadow>[
//                                     BoxShadow(
//                                         color: Colors.transparent,
//                                         offset: const Offset(2.0, 4.0),
//                                         blurRadius: 8),
//                                   ],
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: const BorderRadius.all(
//                                       Radius.circular(60.0)),
//                                   child: Image.asset(
//                                     AppImageAsset.imagesLogo,
//                                     fit: BoxFit.contain,
//                                   ),
//                                 )),
//                           ),
//                         );
//                       },
//                     ),
//                     CustomTextStyle(title: "SHALEEH | شاليه"),
//                     Padding(
//                         padding: const EdgeInsets.only(top: 10, left: 5),
//                         child: CustomTextStyle(
//                           fontSize: 15,
//                           title:
//                               '${sharedService.sharedPref.getString('username')}',
//                         )),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8, left: 4),
//                       child: CustomTextCuption(
//                         fontSize: 13,
//                         title: '${sharedService.sharedPref.getString('email')}',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 4,
//             ),
//             Divider(
//               height: 1,
//               color: isDarkModeEnabled
//                   ? AppColors.lightColor
//                   : const Color(0xFF3A5160).withOpacity(0.6),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 physics: const BouncingScrollPhysics(),
//                 padding: const EdgeInsets.all(0.0),
//                 itemCount: drawerList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//                       child: Row(children: <Widget>[
//                         Container(
//                           width: 6.0,
//                           height: 46.0,
//                           decoration: BoxDecoration(
//                             color: widget.screenIndex == drawerList[index].index
//                                 ? isDarkModeEnabled
//                                     ? AppColors.blueStyleColor3
//                                     : AppColors.blueColor
//                                 : AppColors.greyColor,
//                             borderRadius: const BorderRadius.only(
//                               topLeft: Radius.circular(16),
//                               topRight: Radius.circular(0),
//                               bottomLeft: Radius.circular(16),
//                               bottomRight: Radius.circular(0),
//                             ),
//                           ),
//                         ),
//                         inkwell(drawerList[index]),
//                       ]));
//                 },
//               ),
//             ),
//             Divider(
//               height: 1,
//               color: const Color(0xFF3A5160).withOpacity(0.6),
//             ),
//             Column(
//               children: <Widget>[
//                 Material(
//                   color: Colors.transparent,
//                   child: InkWell(
//                     child: ListTile(
//                       title: CustomTextStyle(
//                         textAlign: TextAlign.center,
//                         title: '110'.tr,
//                         fontSize: 18,
//                       ),
//                       leading: const Icon(
//                         Iconsax.logout_14,
//                         size: 30,
//                         color: Colors.red,
//                       ),
//                       onTap: () {
//                         logOutDialogWidget(context);
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).padding.bottom,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget inkwell(DrawerList listData) {
//     bool isDarkModeEnabled =
//         sharedService.sharedPref.getBool('isDark') ?? false;
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//         splashColor: Colors.grey.withOpacity(0.1),
//         highlightColor: Colors.transparent,
//         onTap: () {
//           navigationtoScreen(listData.index);
//         },
//         child: Stack(
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
//               child: Row(
//                 children: <Widget>[
//                   const SizedBox(
//                     width: 10.0,
//                     height: 46.0,
                   
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.all(4.0),
//                   ),
//                   if (listData.isAssetsImage)
//                     SizedBox(
//                       width: 24,
//                       height: 24,
//                       child: Image.asset(listData.imageName,
//                           color: widget.screenIndex == listData.index
//                               ? AppColors.blueStyleColor3
//                               : AppColors.greyColor),
//                     )
//                   else
//                     Icon(listData.icon?.icon,
//                         color: widget.screenIndex == listData.index
//                             ? isDarkModeEnabled
//                                 ? AppColors.lightColor
//                                 : AppColors.darkColor
//                             : isDarkModeEnabled
//                                 ? AppColors.lightColor
//                                 : AppColors.blackStyleColor1),
//                   const Padding(
//                     padding: EdgeInsets.all(4.0),
//                   ),
//                   Text(
//                     listData.labelName,
//                     style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: widget.screenIndex == listData.index
//                             ? isDarkModeEnabled
//                                 ? AppColors.lightColor
//                                 : AppColors.darkColor
//                             : isDarkModeEnabled
//                                 ? AppColors.lightColor
//                                 : AppColors.blackStyleColor1),
//                     textAlign: TextAlign.left,
//                   ),
//                 ],
//               ),
//             ),
//             if (widget.screenIndex == listData.index)
//               AnimatedBuilder(
//                 animation: widget.iconAnimationController,
//                 builder: (BuildContext context, _) {
//                   return Transform(
//                     transform: Matrix4.translationValues(
//                         (MediaQuery.of(context).size.width * 0.75 - 64) *
//                             (1.0 - widget.iconAnimationController.value - 1.0),
//                         0.0,
//                         0.0),
//                     child: Padding(
//                       padding: const EdgeInsets.only(top: 8, bottom: 8),
//                       child: Container(
//                         width: MediaQuery.of(context).size.width * 0.75 - 60,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: isDarkModeEnabled
//                               ? AppColors.greyColor.withOpacity(0.2)
//                               : AppColors.blueColor.withOpacity(0.2),
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(28),
//                             bottomLeft: Radius.circular(28),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )
//             else
//               const SizedBox()
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
//     widget.callBackIndex(indexScreen);
//   }
// }

// enum DrawerIndex { home, help, feedback, invite, about, logout }

// class DrawerList {
//   DrawerList({
//     required this.index,
//     this.icon,
//     this.isAssetsImage = false,
//     this.labelName = '',
//     this.imageName = '',
//   });

//   String labelName;
//   Icon? icon;
//   bool isAssetsImage;
//   String imageName;
//   DrawerIndex index;
// }
