import 'dart:convert';
import 'package:http/http.dart' as http;

final apiUrl = 'https://60d613dc943aa60017768dd4.mockapi.io/api';

class UserBranch {
  UserBranch({
    this.branch,
    this.userId,
    this.id,
  });

  String branch;
  String userId;
  String id;

  factory UserBranch.fromJson(Map<String, dynamic> json) => UserBranch(
        branch: json["branch"],
        userId: json["userId"],
        id: json["id"],
      );
}

List<UserBranch> parseUserBranch(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<UserBranch>((json) => UserBranch.fromJson(json)).toList();
}

class ApiService {
  Future<String> getUserBranch(String id) async {
    try {
      final response = await http.get(Uri.parse(apiUrl + '/branches'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .where((element) => element['userId'] == id)
            .first['branch'];
      }
    } catch (e) {
      return '';
    }
  }

  Future<bool> setUserBranch(
    String id,
    String branch,
  ) async {
    final response = await http.post(Uri.parse(apiUrl + '/branches'),
        body: {'branch': branch, 'userId': id});
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
