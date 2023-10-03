import 'package:dropdown_search/dropdown_search.dart';
import 'package:sportapp/auth_module/controllers/auth_controller.dart';
import 'package:sportapp/configurations/imports.dart';
import 'package:sportapp/vip_module/controllers/match_controller.dart';
import 'package:sportapp/vip_module/models/match_model.dart';
import 'package:sportapp/vip_module/models/team_models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:sportapp/vip_module/providers/team_provider.dart';

class CreateTipMatch extends StatefulWidget {
  const CreateTipMatch({Key? key}) : super(key: key);

  @override
  State<CreateTipMatch> createState() => _CreateTipMatchState();
}

class _CreateTipMatchState extends State<CreateTipMatch> {
  TeamController teamController = TeamController();
  AuthController authController = AuthController();
  TextEditingController tip = TextEditingController();
   int homeTeam = 0;
   int awayTeam = 0;
  String matchOption = 'FREE';
  int matchOptionNew = 0;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  late DateTime playtime;

  @override
  void initState() {
    // TODO: implement initState
    teamController.fetchTeams();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: authController.formKey,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ), // Adjust this height as needed
              DropdownSearch<TeamModel>(
                enabled: true,
                compareFn: (team1, team2) => team1.strTeam == team2.strTeam,
                popupProps: const PopupProps.modalBottomSheet(
                    showSearchBox: true,
                    showSelectedItems: true,
                    isFilterOnline: true),
                // filterFn: (TeamModel,filter)=>TeamModel.strTeam!,
                items: teamController.teams,
                // showSearchBox: true,
                itemAsString: (TeamModel u) => u.strTeam.toString(),
                onChanged: (TeamModel? data) {
                  setState(() {
                    homeTeam = data!.id!;
                    print(homeTeam);
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Team Name"),
                ),
              ),

              const SizedBox(height: 20),
              DropdownSearch<TeamModel>(
                enabled: true,
                compareFn: (team1, team2) => team1.strTeam == team2.strTeam,
                popupProps: const PopupProps.modalBottomSheet(
                    showSearchBox: true,
                    showSelectedItems: true,
                    isFilterOnline: true),
                // filterFn: (TeamModel,filter)=>TeamModel.strTeam!,
                items: teamController.teams,
                // showSearchBox: true,
                itemAsString: (TeamModel u) => u.strTeam.toString(),
                onChanged: (TeamModel? data) {
                  setState(() {
                    awayTeam = data!.id!;
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Away Name"),
                ),
              ),

              const SizedBox(height: 20),

              DropdownSearch<String>(
                enabled: true,
                popupProps: const PopupProps.modalBottomSheet(
                    showSelectedItems: true, isFilterOnline: true),
                // filterFn: (TeamModel,filter)=>TeamModel.strTeam!,
                items: const ['FREE', 'VIP'],
                // showSearchBox: true,
                onChanged: (data) {
                  setState(() {
                    matchOption = data.toString();
                  });
                },
                dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration:
                      InputDecoration(labelText: "Match Option"),
                ),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: tip,
                autocorrect: true,
                autofocus: true,
                decoration: const InputDecoration(label: Text('Prediction')),
              ),

              const SizedBox(
                height: 10,
              ),
              DateTimeField(
                format: format,
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    setState(() {
                      playtime = DateTimeField.combine(date, time);
                      print(playtime);
                    });
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                color: Colors.black,
                child: TextButton(
                    onPressed: () {
                      if (matchOption == 'FREE') {
                        setState(() {
                          matchOptionNew = 0;
                        });
                      } else {
                        setState(() {
                          matchOptionNew = 1;
                        });
                      }
                      //
                      var data = {
                        "match_tips": tip.text,
                        "is_free": matchOptionNew.toString(),
                        "play_date": playtime.toString(),
                        "home_team_id": homeTeam.toString(),
                        "away_team_id": awayTeam.toString(),
                      };

                      TeamProviders().uploadMatch(data);

                      // TeamProviders().uploadMatch(MatchModel(
                      //     matchTips: tip.text,
                      //     homeTeamId: homeTeam,
                      //     awayTeamId: awayTeam,
                      //     playDate: playtime,
                      //     status: '',
                      //     result: '',
                      //     isFree: matchOptionNew
                      // ));
                    },
                    child: const Text('Upload Match')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
