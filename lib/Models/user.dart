import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  dynamic statusCode;
  dynamic accountNumber;
  dynamic firstName;
  dynamic secondName;
  dynamic thirdName;
  dynamic fullName;
  dynamic balance;
  dynamic profilePic;
  dynamic token;
  dynamic message;
  dynamic error;

  User({
    this.statusCode,
    this.token,
    this.message,
    this.firstName,
    this.secondName,
    this.thirdName,
    this.fullName,
    this.accountNumber,
    this.error,
    this.balance,
    this.profilePic,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        statusCode: json['status_code'],
        accountNumber: json['account_number'],
        firstName: json['first_name'],
        secondName: json['second_name'],
        thirdName: json['third_name'],
        fullName: json['full_name'],
        balance: json['balance'],
        profilePic: json['profile_pic'],
        token: json['token'],
        message: json['message'],
        error: json['error'],
      );
}



















































  // User(
  //     {required this.id,
  //     required this.name,
  //     required this.phone,
  //     required this.token,
  //     required this.isMember});



  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['phone'] = this.phone;
  //   data['token'] = this.token;
  //   data['isMember'] = this.isMember;
  //   return data;
  // }