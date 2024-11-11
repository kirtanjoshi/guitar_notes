// import 'package:coffee_app/features/screens/view/bottom_navgation_bar.dart';
// import 'package:coffee_app/global/Utils/utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
//
// class AuthInitialization extends GetxController {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _auth = FirebaseAuth.instance;
//
//   createUserEmailAndPassword(BuildContext context) async {
//     try {
//       await _auth
//           .createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text.toString(),
//       )
//           .then((value) {
//         Utils.snackBar("Account Created", "Account Created Successfully");
//         Navigator.pop(context);
//         // Navigator.pop(context);
//       });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         Utils.toastMessage("The password provided is too weak.");
//         if (kDebugMode) {
//           print('The password provided is too weak.');
//         }
//       } else if (e.code == 'email-already-in-use') {
//         Utils.toastMessage("The account already exists for that email.");
//         if (kDebugMode) {
//           print('The account already exists for that email.');
//         }
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   signInWithEmailandPassword(BuildContext context) async {
//     try {
//       await _auth
//           .signInWithEmailAndPassword(
//               email: emailController.text.toString(),
//               password: passwordController.text.toString())
//           .then((value) {
//         Utils.snackBar("LoggedIn", "Logged in successfully");
//         Utils.toastMessage(emailController.text.toString());
//         Navigator.push(
//             context, CupertinoPageRoute(builder: (context) => Tabs()));
//       });
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         Utils.toastMessage("user-not-found");
//         if (kDebugMode) {
//           print('No user found for that email.');
//         }
//       } else if (e.code == 'wrong-password') {
//         Utils.toastMessage("wrong-password");
//         if (kDebugMode) {
//           print('Wrong password provided for that user.');
//         }
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
