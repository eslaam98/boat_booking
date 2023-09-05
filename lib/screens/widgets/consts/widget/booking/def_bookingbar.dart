import 'package:boat_booking/screens/pages/items/homecard/custom_price_widget.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefBookingBar extends StatelessWidget {
  final String titlePrice;
  final Widget bookNow;
  const DefBookingBar(
      {super.key, required this.titlePrice, required this.bookNow});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 90,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            bookNow,
            SizedBox(
              width: 40.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextCuption(
                    color: Colors.grey, title: "لكل مجموعة", fontSize: 12),
                CustomPriceWidget(price: titlePrice),
              ],
            )
          ],
        ));
  }
}
