import 'package:boat_booking/config/router/app_image.dart';
import 'package:boat_booking/data/handling/status_request.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? InkWell(
            onTap: () {
              //      Navigator.maybePop(context);
            },
            child: Column(
              children: [
                Center(
                  child: Lottie.asset(AppImageAsset.logoForSplash,
                      width: 250, height: 250),
                ),
                const CustomTextStyle(title: "برجاء الانتظار قليلاً")
              ],
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
            ? InkWell(
                onTap: () {
                  //   Navigator.maybePop(context);
                },
                child: Column(
                  children: [
                    Center(
                        child: Lottie.asset(AppImageAsset.noInternet,
                            width: 250, height: 250)),
                    const CustomTextStyle(title: "خطأ في الشبكة")
                  ],
                ))
            : statusRequest == StatusRequest.serverfailure
                ? InkWell(
                    onTap: () {
                      //   Navigator.maybePop(context);
                    },
                    child: Column(
                      children: [
                        Center(
                          child: Lottie.asset(AppImageAsset.noInternet,
                              width: 250, height: 250),
                        ),
                        const CustomTextStyle(
                            title: "هناك خطأ في الخادم من فضلك حاول مرة اخري")
                      ],
                    ))
                : statusRequest == StatusRequest.failure
                    ? InkWell(
                        onTap: () {
                          //    Navigator.maybePop(context);
                        },
                        child: Column(
                          children: [
                            Center(child: Lottie.asset(AppImageAsset.noData)),
                            const CustomTextStyle(title: "لا توجد بيانات")
                          ],
                        ),
                      )
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? InkWell(
            onTap: () {
              //   Navigator.maybePop(context);
            },
            child: Center(
                child: Lottie.asset(AppImageAsset.loading,
                    width: 250, height: 250)))
        : statusRequest == StatusRequest.offlinefailure
            ? InkWell(
                onTap: () {
                  //   Navigator.maybePop(context);
                },
                child: Center(
                    child: Lottie.asset(AppImageAsset.serverOfffline,
                        width: 250, height: 250)))
            : statusRequest == StatusRequest.serverfailure
                ? InkWell(
                    onTap: () {
                      //    Navigator.maybePop(context);
                    },
                    child: Center(
                        child: Lottie.asset(AppImageAsset.noInternet,
                            width: 250, height: 250)))
                : statusRequest == StatusRequest.failure
                    ? InkWell(
                        onTap: () {
                          //s    Navigator.maybePop(context);
                        },
                        child: Center(
                            child: Lottie.asset(AppImageAsset.serverError,
                                width: 250, height: 250)))
                    : widget;
  }
}
