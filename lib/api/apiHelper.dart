import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pet_app/model/pet.dart';

class ApiEngine {
  ApiEngineConfig apiEngineConfig = ApiEngineConfig(null);

  Future<http.Response> post(dynamic payload) {
    return http.post(
      Uri.http('${apiEngineConfig.server}', '/pet'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(payload),
    );
  }

}

class ApiEngineConfig {
  static final config = {
    'defaultServer':'192.168.99.65:8085'
  };
  String? server;
  ApiEngineConfig(lServer){
    this.server = lServer ?? config['defaultServer'];
  }
}
