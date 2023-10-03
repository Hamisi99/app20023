import 'dart:convert';

import 'package:sportapp/Widgets_module/views/navigations.dart';
import 'package:sportapp/auth_module/controllers/auth_controller.dart';
import 'package:sportapp/configurations/imports.dart';
import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  final GetStorage cache = GetStorage();
  AuthController authController = AuthController();

  Future<dynamic> login(data) async {
    authController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}users/login");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try {
      var response = await http.post(url, body: data, headers: headers);
      if (response.statusCode == 200) {
        authController.isLoading(false).obs;
        var user = userModelFromJson(response.body);
        cache.write('token', user.token);
        // print('cache ${cache.read("token")}');
        // print('${cache.read("token")}');
        cache.write('user', user.user.toJson());
        Get.to(Navigation());

      } else if (response.statusCode == 401) {
        authController.isLoading(false).obs;
        // var message = User.fromJson(jsonDecode(response.body)['user']);
        Get.snackbar('Login', 'Wrong Credentials');
      }
    } catch (e) {
      authController.isLoading(false).obs;
      Get.snackbar('Login', e.toString());
    }
  }
}
