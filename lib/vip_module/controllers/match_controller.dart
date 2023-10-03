import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/vip_module/models/team_models.dart';
import 'package:sportapp/vip_module/providers/team_provider.dart';

class TeamController extends GetxController {
  var teams = List<TeamModel>.empty(growable: true).obs;
  var vipmatches = List<Tipsmodel>.empty(growable: true).obs;
  var viphistory = List<Tipsmodel>.empty(growable: true).obs;
  Rx<bool> isLoading = false.obs;

  void fetchTeams() {
    TeamProviders().fetchTeams().then((value) {
       teams.value = value;
    });
  }


  void fetchVIP() {
    TeamProviders().fetchVIP().then((value) {
      vipmatches.value = value;
    });
  }


  void fetchVIPHistory() {
    TeamProviders().fetchVIPHistory().then((value) {
      viphistory.value = value;
    });
  }





}
