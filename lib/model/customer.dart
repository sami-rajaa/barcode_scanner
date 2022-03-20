import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:barcode_scanner/model/cash_in_model.dart';

class CustomerModel {
  final String name;
  final String phoneNo;
  final List<CashModel> cashRecords;
  CustomerModel({
    required this.name,
    required this.phoneNo,
    required this.cashRecords,
  });

  CustomerModel copyWith({
    String? name,
    String? phoneNo,
    List<CashModel>? cashRecords,
  }) {
    return CustomerModel(
      name: name ?? this.name,
      phoneNo: phoneNo ?? this.phoneNo,
      cashRecords: cashRecords ?? this.cashRecords,
    );
  }

  CustomerModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'],
        phoneNo = snapshot.data()['phoneNo'],
        cashRecords = List<CashModel>.from(
            snapshot.data()['cashRecords']?.map((x) => CashModel.fromMap(x)));
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'phoneNo': phoneNo});
    result.addAll({'cashRecords': cashRecords.map((x) => x.toMap()).toList()});

    return result;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      name: map['name'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      cashRecords: List<CashModel>.from(
          map['cashRecords']?.map((x) => CashModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomerModel(name: $name, phoneNo: $phoneNo, cashRecords: $cashRecords)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.name == name &&
        other.phoneNo == phoneNo &&
        listEquals(other.cashRecords, cashRecords);
  }

  @override
  int get hashCode => name.hashCode ^ phoneNo.hashCode ^ cashRecords.hashCode;
}
