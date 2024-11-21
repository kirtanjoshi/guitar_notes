import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/features/screens/view/save%20page/save_entities.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _controller = Get.put(LyricsController());

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
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
          title: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Guitar",
                    style: TextStyle(
                        fontFamily: "BraahOne",
                        fontSize: 50,
                        color: AppColor.primaryColor),
                  ),
                  TextSpan(
                    text: "Notes",
                    style: TextStyle(
                        fontFamily: "BraahOne",
                        fontSize: 25,
                        color: AppColor.primaryColor),
                  ) // Empty TextSpan for debugging
                ],
              ),
            ),
          ),
        ),
        body: _controller.entries.isEmpty
            ? Center(
                child: Opacity(
                  opacity: 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/rafiki.png",
                        height: 0.3.sh,
                      ),
                      Text(
                        "Add your own notes",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Cousine"),
                      )
                    ],
                  ),
                ),
              )
            : Obx(() {
                return ListView.builder(
                  itemCount: _controller.entries.length,
                  itemBuilder: (context, index) {
                    final entry = _controller.entries[index];
                    final title = entry['title'] as String;

                    return ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inconsolata",
                        ),
                      ),
                      onTap: () {
                        // Navigate to SavedEntriesList with the selected entry
                        Get.to(
                          SavedEntriesList(
                            savedEntries: [entry],
                          ),
                          // Pass the selected song's details
                        );
                      },
                    );
                  },
                );
              }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/addScreen");
          },
          backgroundColor: AppColor.primaryColor,
          child: Text("+"),
        ),
      ),
    );
  }
}
