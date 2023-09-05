import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/config/themes/fontstyle.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/data/handling/handling_data_view.dart';
import 'package:boat_booking/domain/controller/items/yachetdetails_controller.dart';
import 'package:boat_booking/screens/widgets/consts/widget/booking/def_bookingbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/booking/def_date_widget.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_columndetails.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_yachetname_wid.dart';
import 'package:boat_booking/screens/widgets/consts/widget/items/custom_yallowcontainer.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/desc_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';
import 'package:boat_booking/screens/widgets/consts/widget/fullscreenimage_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(YachetDetailesControllerImp());

    return GetBuilder<YachetDetailesControllerImp>(
        builder: (controller) => Scaffold(
            backgroundColor: Colors.white,
            body: Form(
                key: controller.formstate,
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Container(
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
                        right: 16.h,
                        // right: 0,
                        bottom: 0,
                        child: CustomYachetNameWid(
                          yachetName: controller.yachetDetailsModel.itemName!,
                          yachetLocation:
                              controller.yachetDetailsModel.itemLocation!,
                        )),
                    Positioned(
                        left: 14.h,
                        // right: 0,
                        bottom: 3,
                        child: const CustomYallowContainer()),
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
                              height: 20.h,
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
                              height: 30.h,
                            ),
                            CustomColumnDetails(
                              itemHeight:
                                  controller.yachetDetailsModel.itemHeight!,
                              itemweight:
                                  controller.yachetDetailsModel.itemWeight!,
                              itemFlash:
                                  controller.yachetDetailsModel.itemFlash!,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const CustomTextCuption(
                                fontSize: 12, title: "المميزات"),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.customappColors)),
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
                              height: 15.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.customappColors)),
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
                              height: 20.h,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const CustomTextCuption(
                                fontSize: 15, title: "تاريخ الحجز"),
                            SizedBox(
                              height: 10.h,
                            ),
                            DefDateWidget(
                              onDateChange: (selectedDate) {
                                controller.saveSelectedDate(selectedDate);
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            const CustomTextCuption(
                                fontSize: 15, title: "وقت الحجز"),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                                height: 70.h,
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(width: 2),
                                    itemCount: controller.times.length,
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final time = controller.times[index];
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 20,
                                          horizontal: 10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.grey[50]!,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                            color: controller
                                                        .selectedTime.value ==
                                                    time
                                                ? AppColors.customappColors
                                                : Colors
                                                    .transparent, // لون الحد عند التحديد أو عدم التحديد
                                            width: 2,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            controller.saveSelectedTime(time);
                                            print(time);
                                          },
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 10),
                                              Text(controller.times[index],
                                                  style: TextStyle(
                                                      letterSpacing: 0.0,
                                                      fontFamily: AppFontStyle
                                                          .fontStyle,
                                                      fontSize: 18,
                                                      color: controller
                                                                  .selectedTime
                                                                  .value ==
                                                              time
                                                          ?
                                                          //     ? AppColors.lightColor
                                                          //     :
                                                          AppColors
                                                              .customappColors
                                                          : AppColors.greyColor,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(width: 10),
                                            ],
                                          ),
                                        ),
                                      );
                                    })),
                            const SizedBox(height: 35),
                            CustomTextCuption(
                              title: "ملاحظات",
                              fontSize: 15,
                            ),
                            const SizedBox(height: 12),
                            DescTextField(
                              controlleR: controller.orderMSG,
                              title: "اكتب رسالتك هنا",
                            ),
                            SizedBox(height: 20.h),
                            CustomTextCuption(
                              title: "كود الخصم",
                              fontSize: 15,
                            ),
                            SizedBox(height: 10.h),
                            CustomFormFieldThree(
                                controller: controller.orderMSG,
                                title: "ادخل كود الخصم",
                                suffixIcon: MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0)),
                                  clipBehavior: Clip.antiAlias,
                                  height: 25,
                                  minWidth: Get.width * 0.4,
                                  color: AppColors.customappColors,
                                  onPressed: () {},
                                  child: Text("فحص الكود",
                                      style: TextStyle(
                                          letterSpacing: 0.5,
                                          fontFamily: AppFontStyle.fontStyle,
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                )),
                          ]))
                ])),
            bottomNavigationBar: DefBookingBar(
              titlePrice: controller.yachetDetailsModel.itemPrice!,
              bookNow: GetBuilder<YachetDetailesControllerImp>(
                builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: CustomButton(
                      title: "احجز الان",
                      onPressed: () {
                        controller.bookedItem();
                      },
                      textcolor: Colors.white,
                      buttoncolor: AppColors.customappColors,
                      minWidth: Get.width * 0.5,
                      height: 50,
                    )),
              ),
            )));
  }
}
