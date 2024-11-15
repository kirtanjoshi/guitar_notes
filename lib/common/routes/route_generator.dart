// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/fasdfsadf.dart';
// import 'package:guitar_notes/features/screens/view/chords%20edit/chords_note_screen.dart';
// import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
//
// class RouteGenerator {
//   final _controller = Get.find<LyricsController>();
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/chordsnoteScreen':
//         return GetPageRoute(
//           page: () => ChordsNoteScreen(),
//           transition: Transition.cupertino,
//         );
//       case '/SavedEntriesList':
//         return GetPageRoute(
//           page: () => SavedEntriesList(savedEntries: _controller.savedEntries),
//           transition: Transition.cupertino,
//         );
//
//       default:
//         return errorRoute();
//     }
//   }
//
//   static Route<dynamic> errorRoute() {
//     return GetPageRoute(
//       page: () => const Scaffold(
//         body: Center(child: Text("error")),
//       ),
//       transition: Transition.cupertino,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/chords%20edit/chords_note_screen.dart'; // Assuming this is the correct import
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Access the controller using Get.find()
    final _controller = Get.find<LyricsController>();

    switch (settings.name) {
      case '/chordsnoteScreen':
        return GetPageRoute(
          page: () => ChordsNoteScreen(),
          transition: Transition.cupertino,
        );
      // case '/SavedEntriesList':
      //   return GetPageRoute(
      //     page: () => SaveScreen(),
      //     transition: Transition.cupertino,
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return GetPageRoute(
      page: () => const Scaffold(
        body: Center(child: Text("Error")),
      ),
      transition: Transition.cupertino,
    );
  }
}
