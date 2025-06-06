// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:guitar_notes/fasdfsadf.dart';
// import 'package:guitar_notes/features/screens/view/add_chords_screen%20edit/chords_note_screen.dart';
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
import 'package:guitar_notes/features/screens/authentication/login/login.dart';
import 'package:guitar_notes/features/screens/view/add_chords/add_chords.dart';
import 'package:guitar_notes/features/screens/view/add_details/add_details.dart';
import 'package:guitar_notes/features/screens/view/chords_edit/chords_note_screen.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/features/screens/view/dashboard/home_page.dart';

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
      case '/loginScreen':
        return GetPageRoute(
          page: () => LoginScreen(),
          transition: Transition.cupertino,
        );

      case '/addScreen':
        return GetPageRoute(
          page: () => AddDetailScreen(),
          transition: Transition.cupertino,
        );
      case '/addChordsScreen':
        return GetPageRoute(
          page: () => AddChordsScreen(),
          transition: Transition.cupertino,
        );

      case '/homeScreen':
        return GetPageRoute(
          page: () => HomePageScreen(),
          transition: Transition.cupertino,
        );
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
