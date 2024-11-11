import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:guitar_notes/global/constants/app_color.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      "assets/images/rafiki.png",
                      height: 0.3.sh,
                      width: 0.3.sh,
                    ),
                  ),
                  Text("Add Your lyric"),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColor.primaryColor,
          child: Text("+"),
        ),
      ),
    );
  }
}
