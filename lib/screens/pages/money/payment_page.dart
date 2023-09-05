import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/domain/controller/wallet/wallet_controller.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button_tow.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    WalletControllerImp walletControllerImp = Get.put(WalletControllerImp());
    int index = 0;

    return Scaffold(
      backgroundColor: AppColors.lightColor,
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            const CustomAppBar(
                title: CustomTextCuption(
                    fontSize: 20, textAlign: TextAlign.center, title: "الدفع"),
                widgetBar: Text('')),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              child: Card(
                shape: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.customappColors),
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  trailing:
                      Radio(value: true, groupValue: true, onChanged: (gh) {}),
                  leading: const Icon(
                    Ionicons.wallet,
                    color: AppColors.customappColors,
                  ),
                  title: const CustomTextCuption(
                      fontSize: 16, title: "ادفع عن طريق المحفظة"),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: Get.height * 0.21,
              decoration: BoxDecoration(
                  color: AppColors.lightGreenColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomTextCuption(
                          fontSize: 15,
                          color: Colors.grey,
                          title: "رصيدك الحالي"),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextCuption(
                              fontSize: 25,
                              color: AppColors.customappColorstow,
                              fontFamily: 'Open Sans',
                              title:
                                  "${walletControllerImp.walletModel[index].walletPrice}\$"),
                          CustomButtonTow(
                              borderRadius: 10,
                              height: 50,
                              minWidth: Get.width * 0.4,
                              sideColor: AppColors.customappColors,
                              title: "اشحن المحفظة",
                              onPressed: () {}),
                        ],
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Card(
                  shape: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    trailing: Radio(
                        value: false, groupValue: true, onChanged: (gh) {}),
                    leading: const Icon(
                      Ionicons.logo_paypal,
                      color: AppColors.blueStyleColor3,
                    ),
                    minVerticalPadding: 10,
                    title: const CustomTextCuption(
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        title: "Paypal"),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Card(
                  shape: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.greyColor),
                      borderRadius: BorderRadius.circular(16)),
                  child: ListTile(
                    minVerticalPadding: 10,
                    contentPadding: EdgeInsets.all(10),
                    trailing: Radio(
                        value: false, groupValue: true, onChanged: (gh) {}),
                    leading: const Icon(
                      Ionicons.logo_apple,
                      color: AppColors.darkColor,
                    ),
                    title: const CustomTextCuption(
                        fontSize: 16, title: "Apple pay"),
                  )),
            ),
          ])),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: double.infinity,
            height: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextCuption(
                        textAlign: TextAlign.start,
                        fontSize: 20,
                        color: Colors.grey,
                        title: "المجموع"),
                    CustomPriceWidget(price: '130.00'),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  title: "الدفع",
                  onPressed: () {},
                  textcolor: Colors.white,
                  buttoncolor: AppColors.customappColors,
                  minWidth: Get.width * 0.8,
                  height: 50,
                ),
              ],
            )),
      ),
    );
  }
}
