// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:gap/gap.dart';
// // import 'package:get/get.dart';
// // import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
// // import 'package:guitar_notes/global/constants/app_color.dart';
// //
// // //
// // class SavedEntriesList extends StatefulWidget {
// //   final List<Map<String, dynamic>>
// //       savedEntries; // Ensure this is a list of maps
// //
// //   const SavedEntriesList({required this.savedEntries, Key? key})
// //       : super(key: key);
// //
// //   @override
// //   State<SavedEntriesList> createState() => _SavedEntriesListState();
// // }
// //
// // class _SavedEntriesListState extends State<SavedEntriesList> {
// //   final _controller = Get.find<LyricsController>();
// //   @override
// //   void initState() {
// //     _controller.loadentries();
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         backgroundColor: AppColor.backgroundColor,
// //         body: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: ListView.builder(
// //             itemCount: widget.savedEntries.length,
// //             itemBuilder: (context, index) {
// //               final entry = widget.savedEntries[index];
// //
// //               if (entry == null || entry.isEmpty) {
// //                 return Center(
// //                   child: Text(
// //                     "No data available",
// //                     style: TextStyle(color: Colors.white),
// //                   ),
// //                 );
// //               }
// //
// //               final lyrics =
// //                   entry['lyrics'] as String? ?? ''; // Fallback to empty string
// //               final add_chords_screen = entry['add_chords_screen'] as Map<int, Map<int, String>>;
// //
// //               return Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             entry["title"],
// //                             style: TextStyle(
// //                                 color: AppColor.primaryColor,
// //                                 fontFamily: "Cousine",
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 25.sp),
// //                           ),
// //                           Text(
// //                             entry["artist"],
// //                             style: TextStyle(
// //                                 color: AppColor.secondaryColor,
// //                                 fontSize: 20.sp),
// //                           )
// //                         ],
// //                       ),
// //                       IconButton(onPressed: () {}, icon: Icon(Icons.save)),
// //                     ],
// //                   ),
// //                   Gap(0.05.sh),
// //                   Container(
// //                     width: Get.width,
// //                     decoration: BoxDecoration(
// //                         color: Color(0xFF000000),
// //                         borderRadius: BorderRadius.circular(20)),
// //                     padding: EdgeInsets.all(20),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           "Capo Fret :2",
// //                           style: TextStyle(
// //                             // color: Color(0xFFFDF261),
// //                             fontSize: 20.sp,
// //                             color: AppColor.secondaryColor,
// //
// //                             fontFamily: "Inconsolata",
// //                           ),
// //                         ),
// //                         Text(
// //                           "Strumming Pattern : DU DU DU",
// //                           style: TextStyle(
// //                             // color: Color(0xFFFDF261),
// //                             fontSize: 18.sp,
// //                             color: AppColor.secondaryColor,
// //                             fontFamily: "Inconsolata",
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Gap(0.03.sh),
// //                   Text(
// //                     "Saved Lyric:",
// //                     style: TextStyle(
// //                       color: AppColor.secondaryColor,
// //                       fontSize: 12.sp,
// //                       fontFamily: "Cousine",
// //                     ),
// //                   ),
// //                   Card(
// //                     color: AppColor.backgroundColor,
// //                     margin: EdgeInsets.symmetric(vertical: 5),
// //                     child: Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           // Loop through each line of lyrics
// //                           for (int lineIndex = 0;
// //                               lineIndex < lyrics.split('\n').length;
// //                               lineIndex++)
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 // Display add_chords_screen above the corresponding words
// //                                 Wrap(
// //                                   children: [
// //                                     for (int wordIndex = 0;
// //                                         wordIndex <
// //                                             lyrics
// //                                                 .split('\n')[lineIndex]
// //                                                 .split(' ')
// //                                                 .length;
// //                                         wordIndex++)
// //                                       Column(
// //                                         children: [
// //                                           // Display chord if exists
// //                                           Container(
// //                                             width: add_chords_screen[lineIndex]
// //                                                             ?[wordIndex] !=
// //                                                         null &&
// //                                                     add_chords_screen[lineIndex]
// //                                                                 ?[wordIndex]
// //                                                             ?.isNotEmpty ==
// //                                                         true
// //                                                 ? 50
// //                                                 : 0,
// //                                             padding: EdgeInsets.symmetric(
// //                                                 horizontal: 5, vertical: 10),
// //                                             decoration: BoxDecoration(
// //                                                 color: AppColor.secondaryColor,
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(10)),
// //                                             child: Center(
// //                                               child: Text(
// //                                                 add_chords_screen[lineIndex]?[wordIndex] ??
// //                                                     '',
// //                                                 style: TextStyle(
// //                                                   color: Colors.black,
// //                                                   fontWeight: FontWeight.bold,
// //                                                 ),
// //                                               ),
// //                                             ),
// //                                           ),
// //                                           // SizedBox(height: 5),
// //                                           // Display the corresponding word with a space after it
// //                                           Text(
// //                                             lyrics
// //                                                     .split('\n')[lineIndex]
// //                                                     .split(' ')[wordIndex] +
// //                                                 ' ',
// //                                             style: TextStyle(
// //                                               fontSize: 20,
// //                                               color: Colors.white,
// //                                               fontWeight: FontWeight.w500,
// //                                               fontFamily: "Inconsolata",
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                   ],
// //                                 ),
// //                                 const SizedBox(height: 10),
// //                               ],
// //                             ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
// import 'package:guitar_notes/global/constants/app_color.dart';
//
// class SavedEntriesList extends StatefulWidget {
//   final List<Map<String, dynamic>>
//       savedEntries; // Ensure this is a list of maps
//
//   const SavedEntriesList({required this.savedEntries, Key? key})
//       : super(key: key);
//
//   @override
//   State<SavedEntriesList> createState() => _SavedEntriesListState();
// }
//
// class _SavedEntriesListState extends State<SavedEntriesList> {
//   final _controller = Get.find<LyricsController>();
//   final ScrollController _scrollController = ScrollController();
//   Timer? _scrollTimer;
//   bool isAutoScrollOn = false;
//   int countdown = 3;
//
//   @override
//   void initState() {
//     _controller.loadentries();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _scrollTimer?.cancel();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   void _startAutoScroll() {
//     // Show countdown
//     setState(() {
//       countdown = 3;
//       isAutoScrollOn = true;
//     });
//
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       if (countdown > 0) {
//         setState(() {
//           countdown--;
//         });
//       } else {
//         timer.cancel();
//         // Start scrolling after countdown
//         _scrollTimer =
//             Timer.periodic(Duration(milliseconds: 100), (scrollTimer) {
//           if (_scrollController.position.pixels >=
//               _scrollController.position.maxScrollExtent) {
//             _scrollTimer?.cancel();
//           } else {
//             _scrollController.jumpTo(
//               _scrollController.position.pixels + 2, // Adjust scroll speed
//             );
//           }
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColor.backgroundColor,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             if (isAutoScrollOn) {
//               // Stop auto-scroll
//               _scrollTimer?.cancel();
//               setState(() {
//                 isAutoScrollOn = false;
//               });
//             } else {
//               _startAutoScroll();
//             }
//           },
//           backgroundColor: AppColor.primaryColor,
//           child: Icon(
//             isAutoScrollOn ? Icons.pause : Icons.play_arrow,
//             color: Colors.white,
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Stack(
//             children: [
//               ListView.builder(
//                 controller: _scrollController,
//                 itemCount: widget.savedEntries.length,
//                 itemBuilder: (context, index) {
//                   final entry = widget.savedEntries[index];
//
//                   if (entry == null || entry.isEmpty) {
//                     return Center(
//                       child: Text(
//                         "No data available",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     );
//                   }
//
//                   final lyrics = entry['lyrics'] as String? ?? '';
//                   final add_chords_screen = entry['add_chords_screen'] as Map<int, Map<int, String>>;
//
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 entry["title"],
//                                 style: TextStyle(
//                                     color: AppColor.primaryColor,
//                                     fontFamily: "Cousine",
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 25.sp),
//                               ),
//                               Text(
//                                 entry["artist"],
//                                 style: TextStyle(
//                                     color: AppColor.secondaryColor,
//                                     fontSize: 20.sp),
//                               )
//                             ],
//                           ),
//                           IconButton(onPressed: () {}, icon: Icon(Icons.save)),
//                         ],
//                       ),
//                       Gap(0.05.sh),
//                       Container(
//                         width: Get.width,
//                         decoration: BoxDecoration(
//                             color: Color(0xFF000000),
//                             borderRadius: BorderRadius.circular(20)),
//                         padding: EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Capo Fret : ${entry["capo"]}",
//                               style: TextStyle(
//                                 fontSize: 20.sp,
//                                 color: AppColor.secondaryColor,
//                                 fontFamily: "Inconsolata",
//                               ),
//                             ),
//                             Text(
//                               "Strumming Pattern : ${entry["strumming"]}",
//                               style: TextStyle(
//                                 fontSize: 18.sp,
//                                 color: AppColor.secondaryColor,
//                                 fontFamily: "Inconsolata",
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Gap(0.03.sh),
//                       Text(
//                         "Saved Lyric:",
//                         style: TextStyle(
//                           color: AppColor.secondaryColor,
//                           fontSize: 12.sp,
//                           fontFamily: "Cousine",
//                         ),
//                       ),
//                       Card(
//                         color: AppColor.backgroundColor,
//                         margin: EdgeInsets.symmetric(vertical: 5),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               for (int lineIndex = 0;
//                                   lineIndex < lyrics.split('\n').length;
//                                   lineIndex++)
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Wrap(
//                                       children: [
//                                         for (int wordIndex = 0;
//                                             wordIndex <
//                                                 lyrics
//                                                     .split('\n')[lineIndex]
//                                                     .split(' ')
//                                                     .length;
//                                             wordIndex++)
//                                           Column(
//                                             children: [
//                                               Container(
//                                                 width: add_chords_screen[lineIndex]
//                                                                 ?[wordIndex] !=
//                                                             null &&
//                                                         add_chords_screen[lineIndex]
//                                                                     ?[wordIndex]
//                                                                 ?.isNotEmpty ==
//                                                             true
//                                                     ? 50
//                                                     : 0,
//                                                 padding: EdgeInsets.symmetric(
//                                                     horizontal: 5,
//                                                     vertical: 10),
//                                                 decoration: BoxDecoration(
//                                                     color:
//                                                         AppColor.secondaryColor,
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             10)),
//                                                 child: Center(
//                                                   child: Text(
//                                                     add_chords_screen[lineIndex]
//                                                             ?[wordIndex] ??
//                                                         '',
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Text(
//                                                 lyrics
//                                                         .split('\n')[lineIndex]
//                                                         .split(' ')[wordIndex] +
//                                                     ' ',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.w500,
//                                                   fontFamily: "Inconsolata",
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 10),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//               if (countdown > 0 && isAutoScrollOn)
//                 Center(
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.black54,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Text(
//                       "$countdown",
//                       style: TextStyle(
//                         fontSize: 40.sp,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/features/screens/view/save%20page/wigets/detail_screen.dart';
import 'package:guitar_notes/features/screens/view/save%20page/wigets/lyricswithchords_screen.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class SavedEntriesList extends StatefulWidget {
  final List<Map<String, dynamic>> savedEntries;

  const SavedEntriesList({required this.savedEntries, Key? key})
      : super(key: key);

  @override
  State<SavedEntriesList> createState() => _SavedEntriesListState();
}

class _SavedEntriesListState extends State<SavedEntriesList> {
  final _controller = Get.find<LyricsController>();
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool isAutoScrollOn = false;
  int countdown = 3;

  @override
  void initState() {
    super.initState();
    // _controller.loadentries();

    setState(() {
      _controller.loadEntries();
    });
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    setState(() {
      countdown = 3;
      isAutoScrollOn = true;
    });

    // Countdown before starting scroll
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
        // Start auto-scrolling after countdown
        const int scrollDurationMs = 500;
        const double scrollIncrement = 10; // Adjust based on speed
        _scrollTimer = Timer.periodic(Duration(milliseconds: scrollDurationMs),
            (scrollTimer) {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent) {
            _scrollTimer?.cancel();
          } else {
            _scrollController.animateTo(
              _scrollController.position.pixels + scrollIncrement,
              duration: const Duration(milliseconds: scrollDurationMs),
              curve: Curves.linear,
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isAutoScrollOn) {
              // Stop auto-scroll
              _scrollTimer?.cancel();
              setState(() {
                isAutoScrollOn = false;
              });
            } else {
              _startAutoScroll();
            }
          },
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            isAutoScrollOn ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              ListView.builder(
                controller: _scrollController,
                itemCount: widget.savedEntries.length,
                itemBuilder: (context, index) {
                  final entry = widget.savedEntries[index];

                  if (entry == null || entry.isEmpty) {
                    return const Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  final lyrics = entry['lyrics'] as String? ?? '';
                  final chords = entry['add_chords_screen']
                          as Map<int, Map<int, String>>? ??
                      {};

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsWidget(entry: entry),
                      LyricsWithChordsWidget(lyrics: lyrics, chords: chords),
                    ],
                  );
                },
              ),
              if (countdown > 0 && isAutoScrollOn)
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "$countdown",
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
