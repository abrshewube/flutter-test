import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://localhost:3000';

  Future<bool> checkStudentExistence(String studentId, String studentPassword) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/students/check'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'studentId': studentId,
          'studentPassword': studentPassword,
        }),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        final bool studentExists = responseBody['exists'];
        return studentExists;
      } else {
        throw Exception('Failed to check student existence');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool> registerUser(String fullName, String email, String password, String studentId, String studentPassword) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName,
        'email': email,
        'password': password,
        'studentId': studentId,
        'studentPassword': studentPassword,
        'status': false,
        'role': 'user'
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to register user');
    }
  }

  Future<bool> verifyEmail(String email, String code) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/verify-email'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'code': code
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to verify email');
    }
  }

  Future<bool> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<List<dynamic>> getAnnouncements(int page, int limit) async {
    final response = await http.get(
      Uri.parse('$baseUrl/announcements?page=$page&limit=$limit'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load announcements');
    }
  }

  Future<Map<String, dynamic>> getAnnouncementById(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/announcements/$id'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load announcement');
    }
  }

  Future<bool> createAnnouncement(String title, String content, String category, String summary, DateTime date, String image, String tag) async {
    final response = await http.post(
      Uri.parse('$baseUrl/announcements'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'content': content,
        'category': category,
        'summary': summary,
        'date': date.toIso8601String(),
        'image': image,
        'tag': tag
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to create announcement');
    }
  }

  Future<bool> updateAnnouncement(String id, String title, String content, String category, String summary, DateTime date, String image, String tag) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/announcements/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'content': content,
        'category': category,
        'summary': summary,
        'date': date.toIso8601String(),
        'image': image,
        'tag': tag
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update announcement');
    }
  }

  Future<bool> deleteAnnouncement(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/announcements/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete announcement');
    }
  }

  Future<bool> createComment(String content, String userId, String announcementId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/comments'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'content': content,
        'userId': userId,
        'announcementId': announcementId
      }),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to create comment');
    }
  }

  Future<List<dynamic>> getCommentsByAnnouncementId(String announcementId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/comments?announcementId=$announcementId'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<Map<String, dynamic>> getCommentById(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/comments/$id'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load comment');
    }
  }

  Future<bool> updateComment(String id, String content, String userId, String announcementId) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/comments/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'content': content,
        'userId': userId,
        'announcementId': announcementId
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update comment');
    }
  }

  Future<bool> deleteComment(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/comments/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to delete comment');
    }
  }
}
