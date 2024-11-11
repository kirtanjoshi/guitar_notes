// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool? status;
  Data? data;
  String? message;

  UserModel({
    this.status,
    this.data,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  String? id;
  String? fullName;
  String? phoneNumber;
  String? address;
  String? email;
  String? password;
  int? profileProgress;
  String? dataId;
  DateTime? updatedOn;
  DateTime? createdOn;
  int? v;

  Data({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.address,
    this.email,
    this.password,
    this.profileProgress,
    this.dataId,
    this.updatedOn,
    this.createdOn,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        fullName: json["fullName"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        email: json["email"],
        password: json["password"],
        profileProgress: json["profileProgress"],
        dataId: json["id"],
        updatedOn: json["updatedOn"] == null
            ? null
            : DateTime.parse(json["updatedOn"]),
        createdOn: json["createdOn"] == null
            ? null
            : DateTime.parse(json["createdOn"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "address": address,
        "email": email,
        "password": password,
        "profileProgress": profileProgress,
        "id": dataId,
        "updatedOn": updatedOn?.toIso8601String(),
        "createdOn": createdOn?.toIso8601String(),
        "__v": v,
      };
}
//
// class UserModel {
//   bool? status;
//   Data? data;
//   String? message;
//
//   UserModel({this.status, this.data, this.message});
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class Data {
//   String? sId;
//   String? fullName;
//   String? phoneNumber;
//   String? address;
//   String? email;
//   String? password;
//   int? profileProgress;
//   String? id;
//   String? updatedOn;
//   String? createdOn;
//   int? iV;
//
//   Data(
//       {this.sId,
//       this.fullName,
//       this.phoneNumber,
//       this.address,
//       this.email,
//       this.password,
//       this.profileProgress,
//       this.id,
//       this.updatedOn,
//       this.createdOn,
//       this.iV});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     fullName = json['fullName'];
//     phoneNumber = json['phoneNumber'];
//     address = json['address'];
//     email = json['email'];
//     password = json['password'];
//     profileProgress = json['profileProgress'];
//     id = json['id'];
//     updatedOn = json['updatedOn'];
//     createdOn = json['createdOn'];
//     iV = json['__v'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['fullName'] = this.fullName;
//     data['phoneNumber'] = this.phoneNumber;
//     data['address'] = this.address;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['profileProgress'] = this.profileProgress;
//     data['id'] = this.id;
//     data['updatedOn'] = this.updatedOn;
//     data['createdOn'] = this.createdOn;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
