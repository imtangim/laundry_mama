// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class OrderDetails {
  final String name;
  final String mobileNO;
  final String houseNo;
  final String roadNo;
  final String thana;
  final String city;
  final String? recomendation;
  final String deliveryDateTime;
  final String pickupDateTime;
  final Map<String, dynamic> listOfCloths;
  final String totalBill;
  final String paymentMethod;
  final String paymentStatus;
  final String orderID;
  final String orderStatus;
  final String paymentID;
  OrderDetails({
    required this.name,
    required this.mobileNO,
    required this.houseNo,
    required this.roadNo,
    required this.thana,
    required this.city,
    this.recomendation,
    required this.deliveryDateTime,
    required this.pickupDateTime,
    required this.listOfCloths,
    required this.totalBill,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderID,
    required this.orderStatus,
    required this.paymentID,
  });
  
  

  

  OrderDetails copyWith({
    String? name,
    String? mobileNO,
    String? houseNo,
    String? roadNo,
    String? thana,
    String? city,
    String? recomendation,
    String? deliveryDateTime,
    String? pickupDateTime,
    Map<String, dynamic>? listOfCloths,
    String? totalBill,
    String? paymentMethod,
    String? paymentStatus,
    String? orderID,
    String? orderStatus,
    String? paymentID,
  }) {
    return OrderDetails(
      name: name ?? this.name,
      mobileNO: mobileNO ?? this.mobileNO,
      houseNo: houseNo ?? this.houseNo,
      roadNo: roadNo ?? this.roadNo,
      thana: thana ?? this.thana,
      city: city ?? this.city,
      recomendation: recomendation ?? this.recomendation,
      deliveryDateTime: deliveryDateTime ?? this.deliveryDateTime,
      pickupDateTime: pickupDateTime ?? this.pickupDateTime,
      listOfCloths: listOfCloths ?? this.listOfCloths,
      totalBill: totalBill ?? this.totalBill,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      orderID: orderID ?? this.orderID,
      orderStatus: orderStatus ?? this.orderStatus,
      paymentID: paymentID ?? this.paymentID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'mobileNO': mobileNO,
      'houseNo': houseNo,
      'roadNo': roadNo,
      'thana': thana,
      'city': city,
      'recomendation': recomendation,
      'deliveryDateTime': deliveryDateTime,
      'pickupDateTime': pickupDateTime,
      'listOfCloths': listOfCloths,
      'totalBill': totalBill,
      'paymentMethod': paymentMethod,
      'paymentStatus': paymentStatus,
      'orderID': orderID,
      'orderStatus': orderStatus,
      'paymentID': paymentID,
    };
  }

  factory OrderDetails.fromMap(Map<String, dynamic> map) {
  return OrderDetails(
    name: map['name'] as String,
    mobileNO: map['mobileNO'] as String,
    houseNo: map['houseNo'] as String,
    roadNo: map['roadNo'] as String,
    thana: map['thana'] as String,
    city: map['city'] as String,
    recomendation: map['recomendation'] != null ? map['recomendation'] as String : null,
    deliveryDateTime: map['deliveryDateTime'] as String,
    pickupDateTime: map['pickupDateTime'] as String,
    listOfCloths: Map<String, dynamic>.from(map['listOfCloths'] as Map<String, dynamic>),
    totalBill: map['totalBill'] as String,
    paymentMethod: map['paymentMethod'] as String,
    paymentStatus: map['paymentStatus'] as String,
    orderID: map['orderID'] as String,
    orderStatus: map['orderStatus'] as String,
    paymentID: map['paymentID'] as String,
  );
}


  String toJson() => json.encode(toMap());

  factory OrderDetails.fromJson(String source) => OrderDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderDetails(name: $name, mobileNO: $mobileNO, houseNo: $houseNo, roadNo: $roadNo, thana: $thana, city: $city, recomendation: $recomendation, deliveryDateTime: $deliveryDateTime, pickupDateTime: $pickupDateTime, listOfCloths: $listOfCloths, totalBill: $totalBill, paymentMethod: $paymentMethod, paymentStatus: $paymentStatus, orderID: $orderID, orderStatus: $orderStatus, paymentID: $paymentID)';
  }

  @override
  bool operator ==(covariant OrderDetails other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.mobileNO == mobileNO &&
      other.houseNo == houseNo &&
      other.roadNo == roadNo &&
      other.thana == thana &&
      other.city == city &&
      other.recomendation == recomendation &&
      other.deliveryDateTime == deliveryDateTime &&
      other.pickupDateTime == pickupDateTime &&
      mapEquals(other.listOfCloths, listOfCloths) &&
      other.totalBill == totalBill &&
      other.paymentMethod == paymentMethod &&
      other.paymentStatus == paymentStatus &&
      other.orderID == orderID &&
      other.orderStatus == orderStatus &&
      other.paymentID == paymentID;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      mobileNO.hashCode ^
      houseNo.hashCode ^
      roadNo.hashCode ^
      thana.hashCode ^
      city.hashCode ^
      recomendation.hashCode ^
      deliveryDateTime.hashCode ^
      pickupDateTime.hashCode ^
      listOfCloths.hashCode ^
      totalBill.hashCode ^
      paymentMethod.hashCode ^
      paymentStatus.hashCode ^
      orderID.hashCode ^
      orderStatus.hashCode ^
      paymentID.hashCode;
  }
}
