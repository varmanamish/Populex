import 'dart:convert';
import 'dart:async'; // Import for TimeoutException
import 'package:http/http.dart' as http;
import 'package:vivi25/pages/community/models/posts.dart';
import '../models/law_user_model.dart';

class ApiService {
  final String _baseUrl = "http://192.168.126.159:8081"; // Update if needed

  Future<Map<String, dynamic>> register(LawUser user) async {
    try {
      print('Sending registration data: ${jsonEncode(user.toJson())}');

      final response = await http
          .post(
            Uri.parse("$_baseUrl/api/register"),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(user.toJson()),
          )
          .timeout(const Duration(seconds: 10));

      print('Raw response status: ${response.statusCode}');
      print('Raw response headers: ${response.headers}');
      print('Raw response body: ${response.body}');

      if (response.body.isEmpty) {
        return {"success": false, "message": "Server returned empty response"};
      }

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {
          "success": true,
          "message": data['message'] ?? "Registration successful"
        };
      } else {
        return {
          "success": false,
          "message": data['message'] ??
              "Registration failed with status ${response.statusCode}"
        };
      }
    } on TimeoutException {
      return {
        "success": false,
        "message": "Connection timed out. Please try again later."
      };
    } on FormatException catch (e) {
      return {
        "success": false,
        "message": "Server response format error: ${e.message}"
      };
    } catch (e) {
      return {"success": false, "message": "Unexpected error: ${e.toString()}"};
    }
  }

  Future<Map<String, dynamic>> login(String input, String password) async {
    final url = Uri.parse('$_baseUrl/api/login');

    try {
      final response = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'input': input,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10)); // Set timeout duration

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': data['success'],
          'message': data['message'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'message': 'Invalid response from server',
        };
      }
    } on TimeoutException {
      return {
        'success': false,
        'message': 'Connection timed out. Please try again later.',
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e',
      };
    }
  }

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('http://192.168.238.159:8081/api/posts'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print('Fetch Products Response: ${response.statusCode} - ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      print(body);
      return body.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
