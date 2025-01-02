import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class ChordsDetailsWidget extends StatelessWidget {
  const ChordsDetailsWidget({
    super.key,
    required this.entry,
  });

  final Map<String, dynamic> entry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry["title"],
          style: TextStyle(
            color: AppColor.primaryColor,
            fontFamily: "Cousine",
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
          ),
        ),
        Text(
          entry["artist"],
          style: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: 20.sp,
          ),
        ),
        Gap(0.05.sh),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Capo Fret : ${entry["capo"]}",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColor.secondaryColor,
                  fontFamily: "Inconsolata",
                ),
              ),
              Text(
                "Strumming Pattern : ${entry["strumming"]}",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColor.secondaryColor,
                  fontFamily: "Inconsolata",
                ),
              ),
            ],
          ),
        ),
        Gap(0.03.sh),
        Text(
          "Saved Lyric:",
          style: TextStyle(
            color: AppColor.secondaryColor,
            fontSize: 12.sp,
            fontFamily: "Cousine",
          ),
        ),
        Gap(0.01.sh),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: const Color(0xFF000000),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " ${entry["chords"]}",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColor.secondaryColor,
                  fontFamily: "Inconsolata",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
