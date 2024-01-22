// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String email;

  final String address;

  final List<Map<String, dynamic>> orders;
  final String phoneNum;
  final String profileImgUrl;
  final String uid;
  UserModel({
    required this.name,
    required this.email,
    required this.address,
    required this.orders,
    required this.phoneNum,
    required this.profileImgUrl,
    required this.uid,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? address,
    List<Map<String, dynamic>>? orders,
    String? phoneNum,
    String? profileImgUrl,
    String? uid,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      orders: orders ?? this.orders,
      phoneNum: phoneNum ?? this.phoneNum,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'address': address,
      'orders': orders,
      'phoneNum': phoneNum,
      'profileImgUrl': profileImgUrl,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      orders: List<Map<String, dynamic>>.from((map['orders'] as List<dynamic>)
          .map<Map<String, dynamic>>((order) => order as Map<String, dynamic>)),
      phoneNum: map['phoneNum'] as String,
      profileImgUrl: map['profileImgUrl'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, address: $address, orders: $orders, phoneNum: $phoneNum, profileImgUrl: $profileImgUrl, uid: $uid)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.address == address &&
        listEquals(other.orders, orders) &&
        other.phoneNum == phoneNum &&
        other.profileImgUrl == profileImgUrl &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        address.hashCode ^
        orders.hashCode ^
        phoneNum.hashCode ^
        profileImgUrl.hashCode ^
        uid.hashCode;
  }
}
