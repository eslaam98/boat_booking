import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/screens/pages/auth/forgetpass/forget_password.dart';
import 'package:boat_booking/screens/pages/auth/forgetpass/reset_pass.dart';
import 'package:boat_booking/screens/pages/auth/forgetpass/verify_code.dart';
import 'package:boat_booking/screens/pages/auth/login/login_page.dart';
import 'package:boat_booking/screens/pages/auth/signup/verfiy_code_signup.dart';
import 'package:boat_booking/screens/pages/booking/book_details_page.dart';
import 'package:boat_booking/screens/pages/items/category/categories_details_page.dart';
import 'package:boat_booking/screens/pages/items/details/itemdetails_page.dart';
import 'package:boat_booking/screens/pages/money/payment_page.dart';
import 'package:boat_booking/screens/pages/safari/safaridetails_page.dart';
import 'package:boat_booking/screens/pages/wallet/wallet_page.dart';
import 'package:boat_booking/screens/pages/policy/connectus_page.dart';
import 'package:boat_booking/screens/pages/policy/personinfo_page.dart';
import 'package:boat_booking/screens/pages/policy/privacypolicy_page.dart';
import 'package:boat_booking/screens/pages/policy/termsconditions_page.dart';
import 'package:boat_booking/screens/pages/search/search_page.dart';
import 'package:boat_booking/screens/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/widgets/consts/widget/drawer/drawer_screen.dart';

List<GetPage<dynamic>>? routs = [
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: '/',
      page: () => const SplashScreen()
      //WelcomePage()

      ),
  // GetPage(
  //     middlewares: [MyMiddleWere()],
  //     transition: Transition.upToDown,
  //     curve: Curves.bounceInOut,
  //     name: '/',
  //     page: () => const FirstPageTheme()),
//////==============LOGIN=======================
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.loginPage,
      page: () => const LoginPage()),
  ////    ===========================

//==============MOneyPage===============
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.walletPage,
      page: () => const WalletPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.itemDetailsPage,
      page: () => const ItemDetailsPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.privacyPolicyPage,
      page: () => const PrivacyPolicyPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.searchPage,
      page: () => const SearchPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.drawerScreen,
      page: () => const DrawerScreen()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.forgetPassword,
      page: () => const ForgetPassword()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.resetpassPage,
      page: () => const ResetPass()),

  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.verifyCodeSignUp,
      page: () => const VerifyCodeSignUp()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.verifyCode,
      page: () => const VerifyCode()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.bookingDetailsPage,
      page: () => const BookDetailsPage()),

  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.verifyCodeResetpassPage,
      page: () => const VerifyCode()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.connectUsPage,
      page: () => const ConnectUsPage()),

  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.paymentPage,
      page: () => const PaymentPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.categoriesDetailsPage,
      page: () => const CategoriesDetailsPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.personInfoPage,
      page: () => const PersonInfoPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.termsConditionsPage,
      page: () => const TermsConditionsPage()),
  GetPage(
      transition: Transition.upToDown,
      curve: Curves.bounceInOut,
      name: AppRoute.safariDetailsPage,
      page: () => const SafariDetailsPage()),
];
