import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/domain/controller/safari/safari_controller.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_columndetails.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_yachetname_wid.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_yallowcontainer.dart';
import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custompoint_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/rating_widget.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_buttonshow.dart';
import 'package:boat_booking/screens/widgets/consts/widget/fullscreenimage_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SafariDetailsPage extends StatelessWidget {
  const SafariDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SafariDetailesControllerImp());

    return GetBuilder<SafariDetailesControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: ListView(physics: const BouncingScrollPhysics(), children: [
                Stack(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.57,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullScreenImage(
                                          imageUrl:
                                              '${ServerLink.linkImageUser}/${controller.yachetDetailsModel.itemImage}',
                                        )));
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                                '${ServerLink.linkImageUser}/${controller.yachetDetailsModel.itemImage}',
                            fit: BoxFit.cover,
                            height: Get.height,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      right: 15.h,
                      // right: 0,
                      bottom: 1,
                      child: CustomYachetNameWid(
                        yachetName: controller.yachetDetailsModel.itemName!,
                        yachetLocation:
                            controller.yachetDetailsModel.itemLocation!,
                      )),
                  Positioned(
                      left: 14.h,
                      // right: 0,
                      bottom: 3,
                      child: CustomYallowContainer(
                        iconData: Ionicons.person,
                        title: controller.yachetDetailsModel.itemTotalPeople,
                        titlePeople: "عدد الاعضاء",
                      )),
                  Positioned(
                    top: 30.h,
                    left: 20,
                    right: 11,
                    child: const CustomAppBar(
                        color: Colors.white,
                        title: Text('تفاصيل اليخت'),
                        widgetBar: Text("")),
                  ),
                ]),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          const CustomTextCuption(
                              fontSize: 12, title: "وصف الخدمة"),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomTextCuption(
                              color: Colors.grey,
                              fontSize: 11.h,
                              title: controller.yachetDetailsModel.itemDesc!),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomColumnDetails(
                            itemHeight:
                                controller.yachetDetailsModel.itemHeight!,
                            itemweight:
                                controller.yachetDetailsModel.itemWeight!,
                            itemFlash: controller.yachetDetailsModel.itemFlash!,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          const CustomTextCuption(
                              fontSize: 12, title: "المميزات"),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPointWidget(),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: CustomTextCuption(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    title: controller
                                        .yachetDetailsModel.itemFeatureOne!),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomPointWidget(),
                              SizedBox(
                                width: 10.w,
                              ),
                              Flexible(
                                child: CustomTextCuption(
                                    color: Colors.grey,
                                    fontSize: 10,
                                    title: controller
                                        .yachetDetailsModel.itemFeatureTow!),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const SizedBox(height: 35),
                        ]))
              ]),
              bottomNavigationBar: Container(
                  width: double.infinity,
                  height: 90,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      CustomButton(
                        title: "تقييم الخدمة",
                        onPressed: () {
                          CustomBottomSheet.show(
                              context, const RatingWidget(), 0.5);
                        },
                        textcolor: Colors.white,
                        buttoncolor: AppColors.customappColors,
                        minWidth: Get.width * 0.5,
                        height: 50,
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextCuption(
                              color: Colors.grey,
                              title: "لكل مجموعة",
                              fontSize: 12),
                          CustomPriceWidget(
                              price: controller.yachetDetailsModel.itemPrice!),
                        ],
                      )
                    ],
                  )),
            ));
  }
}
