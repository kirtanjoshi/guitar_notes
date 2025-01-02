import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/chord_save_entities/loaded_screen.dart';
import 'package:guitar_notes/features/screens/view/controller/chords_controller.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/features/screens/view/dashboard/widgets/default_screen.dart';
import 'package:guitar_notes/features/screens/view/dashboard/widgets/loaded_screen.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _controller = Get.put(LyricsController());
  final _chordController = Get.put(ChordsController());

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _controller.loadEntries();
      _chordController.fetchUsers();
    });
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.snackbar("Log Out Successfully", "Log out Completed");
    } catch (e) {
      Get.snackbar("Error", "$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColor.backgroundColor,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  logOut();
                  Navigator.of(context).pushNamed("/loginScreen");
                },
                icon: Icon(Icons.favorite, color: AppColor.primaryColor),
              ),
            ],
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
                        color: AppColor.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: "Notes",
                      style: TextStyle(
                        fontFamily: "BraahOne",
                        fontSize: 25,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Obx(() {
            // Display a loading indicator if the controller is loading
            if (_controller.loading.value) {
              return Center(
                child: CircularProgressIndicator(color: AppColor.primaryColor),
              );
            }

            // Main content when not loading
            return Column(
              children: [
                TabBar(
                  labelColor: AppColor.primaryColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: "Songs"),
                    Tab(text: "Chords"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _controller.entries.isEmpty
                          ? const DefaultScreen()
                          : LoadedScreen(controller: _controller),
                      _chordController.chordList.isEmpty
                          ? const DefaultScreen()
                          : ChordLoadedScreen(controller: _chordController),
                    ],
                  ),
                ),
              ],
            );
          }),
          floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.arrow_menu, // Icon for the main FAB
            overlayColor: Colors.black,
            backgroundColor: AppColor.primaryColor,
            overlayOpacity: 0.5,
            children: [
              // Add Lyric FAB
              SpeedDialChild(
                child: Icon(Icons.library_music),
                label: 'Add Lyric',
                onTap: () {
                  Navigator.of(context).pushNamed("/addScreen");
                },
              ),
              // Add Chord FAB
              SpeedDialChild(
                child: Icon(Icons.music_note),
                label: 'Add Chord',
                onTap: () {
                  Navigator.of(context).pushNamed("/addChordsScreen");
                  print('Add Chord tapped');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
