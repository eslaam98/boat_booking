// import 'package:flutter/material.dart';
// import 'package:hotels_app/utils/constants/save_mode.dart';
// import 'package:hotels_app/view/pages/policy/privacypolicy_page.dart';
// import 'package:hotels_app/view/screens/oner/home/oner_home_page.dart';
// import 'package:hotels_app/view/screens/oner/orders/completed_order_page.dart';
// import 'package:hotels_app/view/screens/user/home/home_page.dart';
// import 'package:hotels_app/view/pages/settings/settings_page.dart';
// import 'package:hotels_app/view/screens/user/order/user_completedorder_page.dart';
// import 'package:hotels_app/view/widgets/drawer/custom_drawer.dart';
// import 'package:hotels_app/view/widgets/drawer/draweruser_controller.dart';

// class NavigationDrawerPage extends StatefulWidget {
//   const NavigationDrawerPage({super.key});

//   @override
//   State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
// }

// class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
 
//   Widget screenView =
//       sharedService.sharedPref.getString('account_type') == 'مستخدم'
//           ? const HomePage()
//           : const OnerHomePage();
//   DrawerIndex drawerIndex = DrawerIndex.home;

//   @override
//   Widget build(BuildContext context) {
//     return DrawerUserController(
//       screenIndex: drawerIndex,
//       drawerWidth: MediaQuery.of(context).size.width * 0.70,
//       onDrawerCall: (DrawerIndex drawerIndexdata) {
//         changeIndex(drawerIndexdata);
//         //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
//       },
//       screenView: screenView,
//       //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
//     );
//   }

//   void changeIndex(DrawerIndex drawerIndexdata) {
//     if (drawerIndex != drawerIndexdata) {
//       drawerIndex = drawerIndexdata;
//       if (drawerIndex == DrawerIndex.home) {
//         if (mounted) {
//           setState(() {
//             screenView =
//                 sharedService.sharedPref.getString('account_type') == 'مستخدم'
//                     ? const HomePage()
//                     : const OnerHomePage();
//           });
//         }
//       } else if (drawerIndex == DrawerIndex.help) {
//         if (mounted) {
//           setState(() {
//             screenView =
//                 sharedService.sharedPref.getString('account_type') == 'مستخدم'
//                     ? const UserCompletedOrderPage()
//                     : const CompletedOrderPage();
//           });
//         }
//       } else if (drawerIndex == DrawerIndex.feedback) {
//         if (mounted) {
//           setState(() {
//             screenView = PrivacyPolicyPage();
//           });
//         }
//       } else if (drawerIndex == DrawerIndex.invite) {
//         if (mounted) {
//           setState(() {
//             screenView = const SettingsPage();
//           });
//         }
//       } else if (drawerIndex == DrawerIndex.about) {
//         if (mounted) {
//           setState(() {
//             screenView = const SettingsPage();
//           });
//         }
       
//       }
//     }
//   }
// }
