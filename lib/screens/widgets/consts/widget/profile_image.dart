import 'package:boat_booking/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  final Widget imageProfile;
  final void Function() onTap;
  const ProfileImage({
    Key? key,
    required this.onTap,
    required this.imageProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
              child: Material(
                  color: Colors.transparent,
                  child: Container(
                      alignment: Alignment.center,
                      color: AppColors.greyCardColor,
                      height: 120.w,
                      width: 120.w,
                      child: imageProfile))),
          Positioned(
            bottom: 0,
            right: 4,
            child: InkWell(
              onTap: onTap,
              child: ClipOval(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: AppColors.blueStyleColor3,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
