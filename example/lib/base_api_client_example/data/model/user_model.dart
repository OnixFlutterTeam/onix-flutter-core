import 'package:example/base_api_client_example/data/model/address_model.dart';
import 'package:example/base_api_client_example/data/model/company_model.dart';

class UserModelList {
  final List<UserModel>? users;

  UserModelList({this.users});

  factory UserModelList.fromJson(List<dynamic> json) {
    List<UserModel> users = [];
    users = json.map((user) => UserModel.fromJson(user)).toList();
    return UserModelList(users: users);
  }
}

class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final AddressModel? address;

  final String? phone;
  final String? website;
  final CompanyModel? company;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"] == null
            ? null
            : AddressModel.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: json["company"] == null
            ? null
            : CompanyModel.fromJson(json["company"]),
      );
}
