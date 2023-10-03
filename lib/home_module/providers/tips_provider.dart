import 'dart:convert';
import 'package:sportapp/auth_module/controllers/auth_controller.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:http/http.dart' as http;
import 'package:sportapp/home_module/models/app_versions.dart';

class TipsProvider extends GetConnect{
TipsController tipsController = TipsController();
AuthController authController = AuthController();

  Future<dynamic> fetchTips() async{
   tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}tips/tips");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        // print(response.body);
        var tips = tipsmodelFromJson(response.body);
        tipsController.isLoading(false).obs;
        return tips;
      }
      // print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }catch(error){
      // print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }



  Future<dynamic> fetchTipsHistoty() async{
   tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}tips/tips/history");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        // print(response.body);
        var tips = tipsmodelFromJson(response.body);
        tipsController.isLoading(false).obs;
        return tips;
      }
      // print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }catch(error){
      // print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }






Future<dynamic> fetchAppVersion() async{
  tipsController.isLoading(true).obs;
  var url = Uri.parse("${authController.domain}users/version");
  var headers = {
    'Accept': 'application/json',
    // 'Authorization': 'Bearer $token'
  };
  try{
    var response = await http.get(url,headers: headers);
    if(response.statusCode == 200){
      // print(response.body);
      var version = appVersionFromJson(response.body);
      tipsController.isLoading(false).obs;
      return version;
    }
  else{
      // print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }
  }catch(error){
    // print(error);
    tipsController.isLoading(false).obs;
    // Get.snackbar('Error', error.toString());
  }
}




}
