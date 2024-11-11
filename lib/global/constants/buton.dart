// import 'package:coffee_app/global/constants/app_color.dart';
// import 'package:flutter/material.dart';
//
// class CommonButton extends StatelessWidget {
//   final bool loading;
//   final String text;
//   final double height, width;
//   final VoidCallback onPress;
//   final Color textColor, buttonColor;
//   const CommonButton(
//       {super.key,
//       required this.buttonColor,
//       this.textColor = Colors.white,
//       this.loading = false,
//       required this.text,
//       required this.height,
//       required this.width,
//       required this.onPress});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPress,
//       child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             color: buttonColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: loading
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Center(
//                   child: Text(
//                     text,
//                     style: TextStyle(
//                         fontFamily: 'Sora',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: AppColor.primaryTextColor),
//                   ),
//                 )),
//     );
//   }
// }
