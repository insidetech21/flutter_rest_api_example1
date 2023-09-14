import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/user.dart';
import '../model/user_name.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final results = json['results'] as List<dynamic>;
        final users = results.map((e) {
          final name = UserName(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last'],
          );

          return User(
            name: name,
            cell: e['cell'],
            email: e['email'],
            gender: e['gender'],
            nat: e['nat'],
            phone: e['phone'],
          );
        }).toList();

        return users;
      } else {
        // Handle the error here by throwing an exception or returning an empty list
        throw Exception("Failed to load users: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any network or decoding errors here
      throw Exception("Error fetching users: $e");
    }
  }
}
