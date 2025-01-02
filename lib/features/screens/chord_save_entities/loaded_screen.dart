import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/chord_save_entities/chord_save_entities.dart';
import 'package:guitar_notes/features/screens/view/controller/chords_controller.dart';

class ChordLoadedScreen extends StatelessWidget {
  const ChordLoadedScreen({
    super.key,
    required this.controller, // Corrected this line
  });

  final ChordsController controller; // Use the passed controller here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.05.sh),
      child: Obx(() {
        // Ensure the list of chord entries exists before accessing
        if (controller.chordList.isEmpty) {
          return Center(child: Text('No chords found'));
        }

        return ListView.builder(
          itemCount: controller.chordList
              .length, // Use controller.users instead of chord_entries
          itemBuilder: (context, index) {
            final chordList = controller.chordList[index];
            final user = FirebaseAuth.instance.currentUser?.email;
            final title =
                chordList['title'] ?? 'Untitled'; // Safeguard for null values
            final artist =
                chordList['artist'] ?? 'Unknown'; // Safeguard for null values

            return Card(
              color: Color(0xFF79797F),
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize:
                        20.sp, // Use ScreenUtil's .sp for scalable font sizes
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inconsolata",
                  ),
                ),
                subtitle: Text(
                  artist,
                  style: TextStyle(
                    fontSize: 15.sp, // Use scalable font size here as well
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Inconsolata",
                  ),
                ),
                onTap: () {
                  // Navigate to SavedEntriesList with the selected entry
                  Get.to(
                    ChordSavedEntriesList(
                      chordSavedEntries: [chordList],
                      // Pass selected song details
                    ),
                  );
                },
                onLongPress: () {
                  // controller.deleteUser(
                  //     entry['id']); // Ensure correct key for deletion
                },
              ),
            );
          },
        );
      }),
    );
  }
}
