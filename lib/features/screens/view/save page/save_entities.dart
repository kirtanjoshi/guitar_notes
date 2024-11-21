import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

//
class SavedEntriesList extends StatefulWidget {
  final List<Map<String, dynamic>>
      savedEntries; // Ensure this is a list of maps

  const SavedEntriesList({required this.savedEntries, Key? key})
      : super(key: key);

  @override
  State<SavedEntriesList> createState() => _SavedEntriesListState();
}

class _SavedEntriesListState extends State<SavedEntriesList> {
  final _controller = Get.find<LyricsController>();
  @override
  void initState() {
    _controller.loadentries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Expanded(
            child: ListView.builder(
              itemCount: widget.savedEntries.length,
              itemBuilder: (context, index) {
                final entry = widget.savedEntries[index];

                if (entry == null || entry.isEmpty) {
                  return Center(
                    child: Text(
                      "No data available",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                final lyrics = entry['lyrics'] as String? ??
                    ''; // Fallback to empty string
                final chords = entry['chords'] as Map<int, Map<int, String>>;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry["title"],
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontFamily: "Cousine",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.sp),
                            ),
                            Text(
                              entry["artist"],
                              style: TextStyle(
                                  color: AppColor.secondaryColor,
                                  fontSize: 20.sp),
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
                    Gap(0.03.sh),
                    Text(
                      "Saved Lyric:",
                      style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontSize: 12.sp,
                        fontFamily: "Cousine",
                      ),
                    ),
                    Card(
                      color: AppColor.backgroundColor,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Loop through each line of lyrics
                            for (int lineIndex = 0;
                                lineIndex < lyrics.split('\n').length;
                                lineIndex++)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Display chords above the corresponding words
                                  Wrap(
                                    children: [
                                      for (int wordIndex = 0;
                                          wordIndex <
                                              lyrics
                                                  .split('\n')[lineIndex]
                                                  .split(' ')
                                                  .length;
                                          wordIndex++)
                                        Column(
                                          children: [
                                            // Display chord if exists
                                            Container(
                                              width: chords[lineIndex]
                                                              ?[wordIndex] !=
                                                          null &&
                                                      chords[lineIndex]
                                                                  ?[wordIndex]
                                                              ?.isNotEmpty ==
                                                          true
                                                  ? 50
                                                  : 0,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 10),
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColor.secondaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                child: Text(
                                                  chords[lineIndex]
                                                          ?[wordIndex] ??
                                                      '',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(height: 5),
                                            // Display the corresponding word with a space after it
                                            Text(
                                              lyrics
                                                      .split('\n')[lineIndex]
                                                      .split(' ')[wordIndex] +
                                                  ' ',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Inconsolata",
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
