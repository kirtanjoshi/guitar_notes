import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
              style: TextStyle(color: Colors.grey, fontFamily: "Cousine"),
            )
          ],
        ),
      ),
    );
  }
}
