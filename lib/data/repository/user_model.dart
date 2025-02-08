import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String name;
  String ?role;
  String ?nid;
  String email;
  String phone;
  String ?city;
  String ?area;
  String ?postalcode;
  String ?services;
  String profilePic;

  UserModel({
    required this.id,
    required this.name,
    required this.role,
    required this.nid,
    required this.email,
    required this.phone,
    required this.city,
    required this.area,
    required this.postalcode,
    required this.services,
    required this.profilePic,
  });

  static UserModel empty() => UserModel(id: " ", name: " ", role: " ", nid: " ", email: " ", phone: " ", city: " ", area: " ", postalcode: " ", services: " ", profilePic: " ");

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'nid': nid,
      'email': email,
      'phone': phone,
      'city': city,
      'area': area,
      'postalcode': postalcode,
      'services': services,
      'profilePic': profilePic,
    };
  }

  factory UserModel.formSnaphot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          name: data['name'] ?? '',
          role: data['role'] ?? '',
          nid: data['nid'] ?? '',
          email: data['email'] ?? '',
          phone: data['phone'] ?? '',
          city: data['city'] ?? '',
          area: data['area'] ?? '',
          postalcode: data['postalcode'] ?? '',
          services: data['services'] ?? '',
          profilePic: data['profilePic'] ?? '');
    }else{
      return UserModel.empty();
    }
  }
}
