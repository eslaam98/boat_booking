import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/wallet/wallet_controller.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jiffy/jiffy.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WalletControllerImp());
    int index = 0;
    return Scaffold(
        backgroundColor: AppColors.lightColor,
        body: GetBuilder<WalletControllerImp>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          CustomAppBar(
                              title: Image.asset(
                                AppImageAsset.logoImage,
                                // height: 50.h,
                              ),
                              widgetBar: const Text('')),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFF1ab5b3),
                              ),
                              height: 180.h,
                              width: Get.width * 0.8,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  CustomTextCuption(
                                      fontFamily: 'Open Sans',
                                      title:
                                          '${controller.walletModel[index].walletPrice} \$',
                                      color: Colors.white,
                                      fontSize: 25),
                                  const CustomTextCuption(
                                      title: 'رصيدك الحالي',
                                      color: Colors.white,
                                      fontSize: 12),
                                  SizedBox(
                                    height: 25.h,
                                  ),
                                  Center(
                                      child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                    clipBehavior: Clip.antiAlias,
                                    height: 50,
                                    minWidth: Get.width * 0.45,
                                    color: AppColors.lightColor,
                                    onPressed: () {
                                      Get.toNamed(AppRoute.paymentPage);
                                    },
                                    child: Text("اشحن المحفظة",
                                        style: TextStyle(
                                            letterSpacing: 0.4,
                                            fontFamily: AppFontStyle.fontStyle,
                                            color: AppColors.customappColorstow,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  )),
                                ],
                              )),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomTextCuption(
                            fontSize: 16,
                            title: "اخر العمليات",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.lightblueColor),
                              child: const Icon(
                                Ionicons.arrow_up,
                                color: AppColors.customappColors,
                              ),
                            ),
                            trailing: CustomTextStyle(
                              title:
                                  "${controller.walletModel[index].walletPrice} \$",
                              fontSize: 20,
                            ),
                            title: CustomTextCuption(
                                title:
                                    "${controller.walletModel[index].walletDetails}"),
                            subtitle: CustomTextCuption(
                                color: Colors.grey,
                                fontSize: 12,
                                title: Jiffy(controller
                                        .walletModel[index].walletTimecreate)
                                    .yMMMMEEEEd),
                          ),
                          Divider(
                            indent: 40.w,
                            thickness: 2,
                          )
                        ])))));
  }
}
