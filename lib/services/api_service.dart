part of '../main.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/';

  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse("$url/users"));

    switch(response.statusCode) {
      case 200:
        return JsonUtils.convertList(json.decode(response.body), User.fromJson);
      default:
        throw Exception('Failed to load users');
    }
  }
}
