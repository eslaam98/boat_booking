import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/custom_button.dart';
import 'package:boat_booking/screens/widgets/consts/buttons/desc_textfield.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:boat_booking/screens/widgets/consts/widget/customformfieldthree.dart';

final TextEditingController editingController = TextEditingController();

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          IconButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(
                Ionicons.remove,
                size: 50,
              )),
          const SizedBox(
            height: 10,
          ),
          const CustomTextCuption(
              textAlign: TextAlign.start, title: "قيم الخدمة"),
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey[50]!,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey[200]!,
                width: 2,
              ),
            ),
            child: RatingBar(
              size: 35,
              alignment: Alignment.center,
              filledIcon: Ionicons.star,
              emptyIcon: Ionicons.star_outline,
              onRatingChanged: (value) => debugPrint('$value'),
              initialRating: 1,
              maxRating: 5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomFormFieldThree(
              controller: editingController,
              title: "اكرامية",
              prefixIcon: const Icon(
                Iconsax.dollar_circle,
                color: AppColors.customappColors,
              ),
              suffixIcon: const Icon(
                Ionicons.logo_usd,
                color: AppColors.customappColors,
              )),
          const SizedBox(
            height: 20,
          ),
          const CustomTextCuption(fontSize: 15, title: "رأيك بالخدمة"),
          const SizedBox(
            height: 10,
          ),
          DescTextField(
            controlleR: editingController,
            title: "",
            prefixIcoN: const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Ionicons.document_text,
                  color: AppColors.customappColors,
                ),
                SizedBox(
                  width: 10,
                ),
                CustomTextCuption(fontSize: 15, title: "اضف هنا"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              textcolor: Colors.white,
              buttoncolor: AppColors.customappColors,
              title: "ارسال",
              onPressed: () {}),
          const SizedBox(
            height: 20,
          ),
        ]));
  }
}
