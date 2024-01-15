import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationService {
  static const String _baseUrl = 'https://www.api.megaplexstars.com/api';
// Create storage
  static final storage = new FlutterSecureStorage();
  static const keyNameJwt = 'jwt';

  static const headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Y2tfZGJjMDI5ZTA2ZWJmZTdmNjg5YjJmZTRiOGJkNzhjNWEyNzlhN2IxYjpjc180ODhjOTNjOTlhOTE3OTc4NzU4N2Y0NmIzYmIyNWZkYzNmYzdlZDBj',
  };

static getHeaderJwt() async {
    final token = await getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
  }

  static Future<String> getToken() async {
    return await storage.read(key: keyNameJwt) ?? '';
  }

  static Future<void> logout() async {
    await storage.delete(key: keyNameJwt);
  }

  static Future<String> login(String email, String password) async {
    final data = {'correo': email, 'password': password};
    final url = Uri.parse('$_baseUrl/login');
    final resp = await http.post(url, body: jsonEncode(data), headers: headers);
    final payload = json.decode(resp.body);
    if (resp.statusCode != 200) {
      print(resp.body);
      throw payload['message'];
    }
    await storage.write(key: keyNameJwt, value: payload['token']);
    return payload['token'];
  }

  static Future<String> registre(String email, String password) async {
    final data = {'correo': email, 'password': password, 'rol': 'USER'};
    final url = Uri.parse('$_baseUrl/registre');
    final resp = await http.post(url, body: jsonEncode(data), headers: headers);
    final payload = json.decode(resp.body);
    if (resp.statusCode != 201) {
      print(resp.body);
      throw payload['message'];
    }
    await storage.write(key: keyNameJwt, value: payload['token']);
    return payload['token'];
  }
}
