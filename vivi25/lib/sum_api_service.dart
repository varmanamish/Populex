import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class SumApiService {
  static const baseUrl = 'http://192.168.99.136:5000';

  static Future<String> summarizeDocument(File file) async {
    final request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/summarize'));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));
    final response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      return jsonDecode(respStr)['summary'] ?? 'No summary found.';
    } else {
      return 'Failed to summarize document.';
    }
  }

  static Future<String> sendQA(String question, File file) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/qa'));
    request.fields['question'] = question;
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();

    if (response.statusCode == 200) {
      final respStr = await response.stream.bytesToString();
      return jsonDecode(respStr)['answer'] ?? 'No answer found.';
    } else {
      return 'Failed to get answer.';
    }
  }
}
