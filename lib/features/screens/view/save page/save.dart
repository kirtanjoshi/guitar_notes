import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class SaveScreen_Entities extends StatefulWidget {
  final List<Map<String, dynamic>> entry; // Ensure this is a list of maps

  const SaveScreen_Entities({required this.entry, Key? key}) : super(key: key);

  @override
  State<SaveScreen_Entities> createState() => _SaveScreen_EntitiesState();
}

class _SaveScreen_EntitiesState extends State<SaveScreen_Entities> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The Unforgiven",
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontFamily: "Cousine",
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp),
                        ),
                        Text(
                          "Metallica",
                          style: TextStyle(
                              color: AppColor.secondaryColor, fontSize: 20.sp),
                        )
                      ],
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                  ],
                ),
                Gap(0.05.sh),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: Color(0xFF000000),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Capo Fret :2",
                        style: TextStyle(
                          // color: Color(0xFFFDF261),
                          fontSize: 20.sp,
                          color: AppColor.secondaryColor,

                          fontFamily: "Inconsolata",
                        ),
                      ),
                      Text(
                        "Strumming Pattern : DU DU DU",
                        style: TextStyle(
                          // color: Color(0xFFFDF261),
                          fontSize: 18.sp,
                          color: AppColor.secondaryColor,
                          fontFamily: "Inconsolata",
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(0.02.sh),
                Text(
                  "Chords",
                  style: TextStyle(
                    color: Color(0xFFFDF261),
                    fontSize: 18.sp,
                    fontFamily: "Cousine",
                  ),
                ),
                Gap(0.01.sh),
                // Obx(
                //   // () => _controller.savedEntries.isEmpty
                //   //     ? Center(child: Text('No saved entries yet!'))
                //       SavedEntriesList(
                //           savedEntries: widget.entry,
                //         )
                // )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
