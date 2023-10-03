// To parse this JSON data, do
//
//     final matchModel = matchModelFromJson(jsonString);
import 'dart:convert';

MatchModel matchModelFromJson(String str) =>
    MatchModel.fromJson(json.decode(str));

String matchModelToJson(MatchModel data) => json.encode(data.toJson());

class MatchModel {
  String matchTips;
  String? result;
  String? status;
  int isFree;
  DateTime playDate;
  int homeTeamId;
  int awayTeamId;

  MatchModel({
    required this.matchTips,
    this.result,
    this.status,
    required this.isFree,
    required this.playDate,
    required this.homeTeamId,
    required this.awayTeamId,
  });

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        matchTips: json["match_tips"],
        result: json["result"],
        status: json["status"],
        isFree: json["is_free"],
        playDate: json["play_date"],
        homeTeamId: json["home_team_id"],
        awayTeamId: json["away_team_id"],
      );

  Map<String, dynamic> toJson() => {
        "match_tips": matchTips,
        "result": result,
        "status": status,
        "is_free": isFree,
        "play_date": playDate,
        "home_team_id": homeTeamId,
        "away_team_id": awayTeamId,
      };
}
