import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/domain/controller/orders/ordersdetails_controller.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button_tow.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jiffy/jiffy.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImp());
    return Scaffold(
        backgroundColor: AppColors.lightColor,
        body: GetBuilder<OrderDetailsControllerImp>(
            builder: (controller) => Padding(
                padding: const EdgeInsets.all(15.0),
                child:
                    ListView(physics: const BouncingScrollPhysics(), children: [
                  const CustomAppBar(
                      title: CustomTextCuption(
                          fontSize: 19,
                          textAlign: TextAlign.center,
                          title: "تفاصيل الحجز"),
                      widgetBar: Text('')),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: Get.height * 0.15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.customappColors),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextCuption(
                            fontFamily: 'Open Sans',
                            color: Colors.white60,
                            title: Jiffy(
                              controller.orderModel.orderTimecreate,
                            ).yMMMMEEEEdjm,
                          ),
                          CustomTextCuption(
                              color: Colors.white,
                              title:
                                  "رقم الطلب : ${controller.orderModel.orderId}"),
                        ]),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  const CustomTextCuption(
                      color: Colors.black, title: "تفاصيل الحجز"),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Get.width * 0.45,
                        height: Get.height * 0.12,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.lightColor3,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              const Icon(
                                Ionicons.calendar_outline,
                                color: AppColors.customappColors,
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Column(
                                children: [
                                  const CustomTextCuption(
                                      color: Colors.grey, title: "تاريخ الحجز"),
                                  CustomTextCuption(
                                    title: Jiffy(
                                      controller.orderModel.orderDate,
                                    ).MEd,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: Get.width * 0.45,
                          height: Get.height * 0.12,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.lightColor3,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 15.w,
                                ),
                                const Icon(
                                  Ionicons.time_outline,
                                  color: AppColors.customappColors,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextCuption(
                                        color: Colors.grey, title: "التوقيت"),
                                    CustomTextCuption(
                                      title:
                                          '${controller.orderModel.orderTime}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const CustomTextCuption(
                      color: Colors.black, title: "ملاحظات"),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextCuption(
                      fontSize: 12,
                      color: Colors.grey,
                      title: '${controller.orderModel.orderMsg}'),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: Get.height * 0.2,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.lightColor3,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              alignment: Alignment.center,
                              height: 100.h,
                              width: 90.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                    imageUrl:
                                        "${ServerLink.linkImageUser}/${controller.orderModel.itemImage}",
                                    height: 90,
                                    width: 90.w,
                                    fit: BoxFit.fill),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextCuption(
                                    fontSize: 18,
                                    color: Colors.black,
                                    title: "${controller.orderModel.itemName}"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Ionicons.location,
                                      color: AppColors.customappColors,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    CustomTextCuption(
                                      title:
                                          '${controller.orderModel.itemLocation}',
                                      fontSize: 12,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CustomButtonTow(
                                        height: 40,
                                        borderRadius: 10,
                                        minWidth: Get.width * 0.35,
                                        sideColor: AppColors.customappColors,
                                        title: "التفاصيل",
                                        onPressed: () {
                                          controller.goToDetailsPage(
                                              controller.yachetDetailsModel);
                                        }),
                                  ],
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: Get.height * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextCuption(title: "الحجز"),
                                CustomTextCuption(
                                    color: AppColors.customappColors,
                                    fontFamily: 'Open Sans',
                                    title:
                                        "${controller.orderModel.orderPrice}\$"),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextCuption(title: "الخصم"),
                                CustomTextCuption(
                                    color: AppColors.customappColors,
                                    fontFamily: 'Open Sans',
                                    title: "0\$"),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomTextCuption(title: "المجموع"),
                                CustomTextCuption(
                                    color: AppColors.customappColors,
                                    fontFamily: 'Open Sans',
                                    title:
                                        "${controller.orderModel.orderPrice}\$"),
                              ],
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  controller.orderModel.orderApprove == "1"
                      ? Column(
                          children: [
                            CustomTextCuption(
                                color: Colors.grey,
                                title: "من فضلك اضغط علي الدفع لاكمال الحجز"),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                                height: 40,
                                buttoncolor: AppColors.customappColors,
                                textcolor: Colors.white,
                                title: "الدفع",
                                onPressed: () {
                                  Get.toNamed(AppRoute.paymentPage);
                                })
                          ],
                        )
                      : SizedBox(
                          height: 10.h,
                        ),
                ]))));
  }
}
