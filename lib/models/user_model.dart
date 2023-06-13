import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String profilePic;
  final int? phone;
  final String uid;
  final List<String> bookings;
  final String? address;
  UserModel({
    required this.name,
    required this.profilePic,
    this.phone,
    required this.uid,
    required this.bookings,
    this.address,
  });

  UserModel copyWith({
    String? name,
    String? profilePic,
    int? phone,
    String? uid,
    List<String>? bookings,
    String? address,
  }) {
    return UserModel(
      name: name ?? this.name,
      profilePic: profilePic ?? this.profilePic,
      phone: phone ?? this.phone,
      uid: uid ?? this.uid,
      bookings: bookings ?? this.bookings,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'phone': phone,
      'uid': uid,
      'bookings': bookings,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      phone: map['phone'] != null ? map['phone'] as int : null,
      uid: map['uid'] as String,
      bookings: List<String>.from(map['bookings']),
      address: map['address'] != null ? map['address'] as String : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(name: $name, profilePic: $profilePic, phone: $phone, uid: $uid, bookings: $bookings, address: $address)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.profilePic == profilePic &&
        other.phone == phone &&
        other.uid == uid &&
        listEquals(other.bookings, bookings) &&
        other.address == address;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        profilePic.hashCode ^
        phone.hashCode ^
        uid.hashCode ^
        bookings.hashCode ^
        address.hashCode;
  }
}
