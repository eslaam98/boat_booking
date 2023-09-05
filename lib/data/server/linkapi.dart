class ServerLink {
  static const String linkServarName = 'https://yahtapp.000webhostapp.com';

  //=====================Images===================

  static const String linkImageUser = '$linkServarName/upload';
  static const String linkYachetsImages = '$linkServarName/upload/yachetpng';

  ///===================================================
  /////////----------auth-------------------------------

  static const String logInLink = '$linkServarName/auth/login.php';
  //
  static const String signUpLink = '$linkServarName/auth/signup.php';
//
  static const String verifyCodeSignUpLink =
      '$linkServarName/auth/verfiycode.php';
  //
  static const String checkEmailLink =
      '$linkServarName/forgetpassword/checkemail.php';
  //
  static const String ressetPasswordLink =
      '$linkServarName/forgetpassword/resetpassword.php';
  //
  static const String verifyCodeLink =
      '$linkServarName/forgetpassword/verfiycodee.php';
  //
  static const String resindCodeLink = '$linkServarName/auth/resendcode.php';
  //
  static const String changPasswordLink = '$linkServarName/auth/changepass.php';
  //
  static const String editUserLink = '$linkServarName/user/edituser.php';
  static const String userAccountLink = '$linkServarName/user/useraccount.php';
  //////////// ==========Suggest=======================
  static const String addSuggestLink = '$linkServarName/suggest/addsuggest.php';

///////==================ViewCategories================
  static const String viewCategoriesLink =
      '$linkServarName/categories/viewcategories.php';
  static const String viewCategoriesIdLink =
      '$linkServarName/categories/viewyachetid.php';
  static const String viewOnerCategoriesLink =
      '$linkServarName/categories/onercategories.php';
  static const String homeLink = '$linkServarName/home/userhome.php';

  ////////////=========BookinGGGGGGGGGG================
  static const String bookingItemLink =
      '$linkServarName/booking/bookingitem.php';
  static const String ordersLink = '$linkServarName/orders/userorders.php';
  //===================Wallet======================
  static const String walletLink = '$linkServarName/wallet/wallet.php';
  static const String addWalletLink = '$linkServarName/wallet/addcash.php';
//==========MostItems================
  static const String mostItemsLink = '$linkServarName/items/mostitems.php';
  static const String itemBookedLink = '$linkServarName/booking/itembooked.php';

  //==========Notiifications==================================
  static const String notificationLink =
      '$linkServarName/notifications/usernotifications.php';

  static const String makeNotificationAsReadLink =
      '$linkServarName/notifications/usernotifications.php';
//==========Searchhhhhhhhhhhhhh=======================
  static const String searchLink = '$linkServarName/serach/search.php';
  static const String searchWithFilterLink =
      '$linkServarName/serach/searchfilter.php';
}
