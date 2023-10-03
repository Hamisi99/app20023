import 'dart:convert';
import 'package:sportapp/auth_module/controllers/auth_controller.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:http/http.dart' as http;
import 'package:sportapp/vip_module/models/match_model.dart';
import 'package:sportapp/vip_module/models/team_models.dart';

class TeamProviders extends GetConnect{
  TipsController tipsController = TipsController();
  AuthController authController = AuthController();
  Future<dynamic> fetchTeams() async{
    tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}teams/teams");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        // print(response.body);
        var teams = teamModelFromJson(response.body);
        // print(teams);
        tipsController.isLoading(false).obs;
        return teams;
      }
      print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }catch(error){
      print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }









  Future<dynamic> uploadMatch(data) async{
    tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}tips/create");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      // print(data.toJson());
      var response = await http.post(url,body: data, headers: headers);
      if(response.statusCode == 201){
       print('ok');
       Get.snackbar('Success', "Uploaded successfully");

      }
      print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't upload data");
    }catch(error){
      print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }







  Future<dynamic> fetchVIP() async{
    tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}tips/vip");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        print(response.body);
        var tips = tipsmodelFromJson(response.body);
        tipsController.isLoading(false).obs;
        return tips;
      }
      print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }catch(error){
      print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }







  Future<dynamic> fetchVIPHistory() async{
    tipsController.isLoading(true).obs;
    var url = Uri.parse("${authController.domain}tips/vip/history");
    var headers = {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    try{
      var response = await http.get(url,headers: headers);
      if(response.statusCode == 200){
        print(response.body);
        var tips = tipsmodelFromJson(response.body);
        tipsController.isLoading(false).obs;
        return tips;
      }
      print(response.statusCode);
      tipsController.isLoading(false).obs;
      Get.snackbar('Error', "Can't load data");
    }catch(error){
      print(error);
      tipsController.isLoading(false).obs;
      // Get.snackbar('Error', error.toString());
    }
  }
}