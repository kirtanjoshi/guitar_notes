import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/chords_note_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/chordsnoteScreen':
        return GetPageRoute(
          page: () => ChordsNoteScreen(),
          transition: Transition.cupertino,
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return GetPageRoute(
      page: () => const Scaffold(
        body: Center(child: Text("error")),
      ),
      transition: Transition.cupertino,
    );
  }
}
