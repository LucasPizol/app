import 'dart:convert';

import 'package:app/config/environment.dart';
import 'package:http/http.dart' as http;

abstract class HttpServiceImpl {
  Future<T> post<T>(String path, Map<String, dynamic> body);
  Future<T> get<T>(String path);
  Future<void> delete(String path);
  Future<T> put<T>(String path, Map<String, dynamic> body);
}

class HttpService extends HttpServiceImpl {
  final String _url = Environment.baseUrl;

  @override
  Future<T> post<T>(String path, Map<String, dynamic> body) async {
    final httpRequest = await http.post(
      Uri.parse('$_url$path'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
    );

    if (httpRequest.statusCode != 200) {
      throw Exception('HttpService.post: ${httpRequest.statusCode}');
    }

    var jsonBody = json.decode(utf8.decode(httpRequest.bodyBytes));

    return jsonBody as T;
  }

  @override
  Future<T> get<T>(String path) async {
    final httpRequest = await http.get(
      Uri.parse('$_url$path'),
      headers: {'Content-Type': 'application/json, charset=utf-8'},
    );

    if (httpRequest.statusCode != 200) {
      throw Exception('HttpService.get: ${httpRequest.statusCode}');
    }

    var jsonBody = json.decode(utf8.decode(httpRequest.bodyBytes));

    return jsonBody as T;
  }

  @override
  Future<void> delete(String path) async {
    final httpRequest = await http.delete(
      Uri.parse('$_url$path'),
      headers: {'Content-Type': 'application/json, charset=utf-8'},
    );

    if (httpRequest.statusCode != 200) {
      throw Exception('HttpService.delete: ${httpRequest.statusCode}');
    }
  }

  @override
  Future<T> put<T>(String path, Map<String, dynamic> body) async {
    final httpRequest = await http.put(
      Uri.parse('$_url$path'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json, charset=utf-8'},
    );

    if (httpRequest.statusCode != 200) {
      throw Exception('HttpService.put: ${httpRequest.statusCode}');
    }

    var jsonBody = json.decode(utf8.decode(httpRequest.bodyBytes));

    return jsonBody as T;
  }
}
