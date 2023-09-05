import 'package:boat_booking/data/server/linkapi.dart';
import 'package:boat_booking/screens/widgets/consts/text/custom_text_cuption.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jiffy/jiffy.dart';

class DefNotiCard extends StatelessWidget {
  final String notificationDesc;
  final String notificationImage;
  final String notificationTitle;
  final String notificationTimecreate;

  const DefNotiCard(
      {super.key,
      required this.notificationDesc,
      required this.notificationImage,
      required this.notificationTitle,
      required this.notificationTimecreate});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            subtitle: CustomTextCuption(
                color: Colors.grey, title: '${notificationDesc}', fontSize: 13),
            leading: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(75)),
              alignment: Alignment.center,
              height: 80.h,
              width: 80.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: CachedNetworkImage(
                    imageUrl:
                        '${ServerLink.linkImageUser}/${notificationImage}',
                    height: 80,
                    width: 80,
                    fit: BoxFit.fill),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextCuption(title: '${notificationTitle}', fontSize: 14),
                CustomTextCuption(
                    color: Colors.grey,
                    title: Jiffy(notificationTimecreate).yMMMMEEEEd,
                    fontSize: 10),
              ],
            )),
        const Divider(
          thickness: 2,
          indent: 60,
        )
      ],
    );
  }
}
