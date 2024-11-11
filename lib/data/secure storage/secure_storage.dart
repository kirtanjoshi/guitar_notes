// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SecureStorage {
//   final FlutterSecureStorage storage = const FlutterSecureStorage();
//
//   // Future<void> writeSecureStorage(String key, dynamic value) async {
//   //   await storage.write(key: key, value: value);
//   //   print("Data Saved :$value");
//   // }
//   //
//   // Future<String?> readSecureStorage(String key) async {
//   //   String value = await storage.read(key: key) ?? "No data Found";
//   //   print("Data read from Secure Storage :$value");
//   // }
//
//   addStringToSF(String key, String value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(key, value);
//     print("Data stored from Secure Storage :$value");
//   }
//
//   getStringValuesSF(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? stringValue = prefs.getString(key);
//     print("Data read from Secure Storage :$stringValue");
//     return stringValue;
//   }
//
//   delete(String key) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     var stringValue = await prefs.remove(key);
//     print("Data deleted from Secure Storage :$stringValue");
//     return stringValue;
//   }
//
//   // Future<void> deleteSecure(String key) async {
//   //   await storage.delete(key: key);
//   // }
// }
