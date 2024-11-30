import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:guitar_notes/common/routes/route_generator.dart';
import 'package:guitar_notes/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  // Clear SharedPreferences (for debugging purposes)
  // await SharedPreferences.getInstance().then((prefs) => prefs.clear());

  // runApp(DevicePreview(
  //     enabled: !kReleaseMode, builder: (context) => const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        home: SplashScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}
