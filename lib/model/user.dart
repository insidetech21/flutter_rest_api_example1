import 'package:flutter_rest_api_example/model/user_name.dart';

class User {
  final UserName name;
  // final Picture Image;
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;

  User({
    required this.name,
    // required this.Image,
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
  });

  String get fullName{

    return '${name.title} ${name.first} ${name.last}';

  }
}


class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
}
