import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/chord_save_entities/wigets/chords_detail_screen.dart';
import 'package:guitar_notes/features/screens/view/controller/chords_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class ChordSavedEntriesList extends StatefulWidget {
  final List<Map<String, dynamic>> chordSavedEntries;

  const ChordSavedEntriesList({required this.chordSavedEntries, Key? key})
      : super(key: key);

  @override
  State<ChordSavedEntriesList> createState() => _ChordSavedEntriesListState();
}

class _ChordSavedEntriesListState extends State<ChordSavedEntriesList> {
  final _chordController = Get.find<ChordsController>();
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  bool isAutoScrollOn = false;
  int countdown = 3;

  @override
  void initState() {
    super.initState();

    setState(() {
      _chordController.fetchUsers();
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
                itemCount: widget.chordSavedEntries.length,
                itemBuilder: (context, index) {
                  final entry = widget.chordSavedEntries[index];

                  if (entry == null || entry.isEmpty) {
                    return const Center(
                      child: Text(
                        "No data available",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ChordsDetailsWidget(entry: entry),
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
