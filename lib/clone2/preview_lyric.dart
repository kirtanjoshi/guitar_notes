// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/clone2/lyric_controller.dart';
// import 'package:guitar_notes/features/screens/view/chords%20edit/widgets/save_entities.dart';
// import 'package:guitar_notes/features/screens/view/dashboard/home_page.dart';
// import 'package:guitar_notes/global/constants/app_color.dart';
//
// class PreviewLyric extends StatefulWidget {
//   const PreviewLyric({super.key});
//
//   @override
//   State<PreviewLyric> createState() => _PreviewLyricState();
// }
//
// class _PreviewLyricState extends State<PreviewLyric> {
//   final _controller = Get.put(LyricsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.backgroundColor,
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             margin: EdgeInsets.all(10),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "The Unforgiven",
//                           style: TextStyle(
//                               color: AppColor.primaryColor,
//                               fontFamily: "Cousine",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 25.sp),
//                         ),
//                         Text(
//                           "Metallica",
//                           style: TextStyle(
//                               color: AppColor.secondaryColor, fontSize: 20.sp),
//                         )
//                       ],
//                     ),
//                     IconButton(
//                         onPressed: () {
//                           _controller.saveLyrics();
//                           Get.to(() => HomePageScreen());
//                         },
//                         icon: Icon(Icons.save)),
//                   ],
//                 ),
//                 Gap(0.05.sh),
//                 Container(
//                   width: Get.width,
//                   decoration: BoxDecoration(
//                       color: Color(0xFF000000),
//                       borderRadius: BorderRadius.circular(20)),
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Capo Fret :2",
//                         style: TextStyle(
//                           // color: Color(0xFFFDF261),
//                           fontSize: 20.sp,
//                           color: AppColor.secondaryColor,
//
//                           fontFamily: "Inconsolata",
//                         ),
//                       ),
//                       Text(
//                         "Strumming Pattern : DU DU DU",
//                         style: TextStyle(
//                           // color: Color(0xFFFDF261),
//                           fontSize: 18.sp,
//                           color: AppColor.secondaryColor,
//                           fontFamily: "Inconsolata",
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Gap(0.02.sh),
//                 Text(
//                   "Chords",
//                   style: TextStyle(
//                     color: Color(0xFFFDF261),
//                     fontSize: 18.sp,
//                     fontFamily: "Cousine",
//                   ),
//                 ),
//                 Gap(0.01.sh),
//                 Obx(
//                   () => _controller.storeEntries.isEmpty
//                       ? Center(child: Text('No saved entries yet!'))
//                       : Expanded(
//                           child: SavedEntriesList(
//                               savedEntries: _controller.storeEntries)),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
