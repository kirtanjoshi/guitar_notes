import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/features/screens/view/controller/chords_controller.dart';
import 'package:guitar_notes/features/screens/view/controller/lyric_controller.dart';
import 'package:guitar_notes/global/constants/app_color.dart';
import 'package:guitar_notes/services/splash_screen_services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _controller = Get.put(LyricsController());
  final _chordController = Get.put(ChordsController());

  SplashServices services = SplashServices();
  @override
  void initState() {
    super.initState();
    _controller.loadEntries();
    _chordController.fetchUsers();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.music_note,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'ChordsNote',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
