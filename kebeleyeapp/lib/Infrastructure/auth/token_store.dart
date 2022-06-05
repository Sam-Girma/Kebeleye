import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  Future<void> save(String username, String id, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', username);
    await preferences.setString("id", id);
    await preferences.setString("token", token);
  }

  Future<bool> hasToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var value = preferences.getString("token");

    return value != null;
  }

  Future<void> deleteAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.clear();
  }

  Future<String?> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? id = preferences.getString('id');
    return id;
  }

  Future<String?> getusername() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    ;
    final String? role = preferences.getString("username");
    return role;
  }

  Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? token = preferences.getString("token");
    return token;
  }
}
