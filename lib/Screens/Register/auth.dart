import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../../main.dart';
import 'Url.dart';

class AuthApis {
  static Future<String?> login(String email, String password) async {
    var response = await http.post(Uri.parse(Api.login),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });
    Map<String, dynamic> json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await sharedPref?.setString('token', json['token']);
      return json['token'];
    }
  }

  static Future<bool?> register({
    required String name,
    required String email,
    required String password,
    required String comfirmpassword,
    required String image,
    required String mobile_phone,
    required String phone,
    required String address,
    required String roll,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(Api.register));
    request.fields.addAll({
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': comfirmpassword,
      'imag': image,
      'mobile_phone': mobile_phone,
      'phone': phone,
      'address': address,
      'roll': roll,
    });
    request.headers.addAll({'Accept': 'application/json'});

    var response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(await response.stream.bytesToString());

      return true;
    } else
      return false;
  }

  static Future<bool?> create_expert({
    required String name,
    required String account,
  }) async {
    var token = sharedPref?.getString('role') == 'Expert'
        ? sharedPref?.getString('token')
        : null;
    var request = http.MultipartRequest('POST', Uri.parse(Api.create_expert));
    request.fields.addAll({
      'name': name,
      'account': account,
    });
    request.headers.addAll({
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var response = await request.send();

    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(await response.stream.bytesToString());

      return true;
    } else
      return false;
  }

  static Future profile() async {
    var token = sharedPref?.getString('token');
    var response = await http.post(Uri.parse(Api.profile),
        body: jsonEncode({
          ////////////
        }),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return json;
    }
  }
}
