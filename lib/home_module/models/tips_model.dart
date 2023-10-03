// To parse this JSON data, do
//
//     final tipsmodel = tipsmodelFromJson(jsonString);

import 'dart:convert';

List<Tipsmodel> tipsmodelFromJson(String str) => List<Tipsmodel>.from(json.decode(str).map((x) => Tipsmodel.fromJson(x)));

String tipsmodelToJson(List<Tipsmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tipsmodel {
  int id;
  TeamId homeTeamId;
  TeamId awayTeamId;
  String matchTips;
  dynamic result;
  dynamic status;
  int isFree;
  DateTime playDate;
  DateTime createdAt;

  Tipsmodel({
    required this.id,
    required this.homeTeamId,
    required this.awayTeamId,
    required this.matchTips,
    this.result,
    this.status,
    required this.isFree,
    required this.playDate,
    required this.createdAt,
  });

  factory Tipsmodel.fromJson(Map<String, dynamic> json) =>Tipsmodel(
    id: json["id"],
    homeTeamId: TeamId.fromJson(json["home_team_id"]),
    awayTeamId: TeamId.fromJson(json["away_team_id"]),
    matchTips: json["match_tips"],
    result: json["result"],
    status: json["status"],
    isFree: json["is_free"],
    playDate: DateTime.parse(json["play_date"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "home_team_id": homeTeamId.toJson(),
    "away_team_id": awayTeamId.toJson(),
    "match_tips": matchTips,
    "result": result,
    "status": status,
    "is_free": isFree,
    "play_date": playDate.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}

class TeamId {
  int id;
  String idTeam;
  String idSoccerXml;
  String idApIfootball;
  String? intLoved;
  String? strTeam;
  String? strTeamShort;
  String? strAlternate;
  String? intFormedYear;
  String? strSport;
  String? strLeague;
  String? idLeague;
  String? strLeague2;
  String? idLeague2;
  String? strLeague3;
  String? idLeague3;
  String? strLeague4;
  String? idLeague4;
  String? strLeague5;
  String? idLeague5;
  String? strLeague6;
  String? idLeague6;
  String? strLeague7;
  String? idLeague7;
  String? strDivision;
  String? strStadium;
  String? strKeywords;
  String? strRss;
  String? strStadiumThumb;
  String?strStadiumDescription;
  String? strStadiumLocation;
  int? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEn;
  String? strDescriptionDe;
  String? strDescriptionFr;
  String? strDescriptionCn;
  String? strDescriptionIt;
  String? strDescriptionJp;
  String? strDescriptionRu;
  String? strDescriptionEs;
  String? strDescriptionPt;
  String? strDescriptionSe;
  String? strDescriptionNl;
  String? strDescriptionHu;
  String? strDescriptionNo;
  String? strDescriptionIl;
  String? strDescriptionPl;
  String? strKitColour1;
  String? strKitColour2;
  String? strKitColour3;
  String? strGender;
  String? strCountry;
  String? strTeamBadge;
  String? strTeamJersey;
  String? strTeamLogo;
  String? strTeamFanart1;
  String? strTeamFanart2;
  String? strTeamFanart3;
  String? strTeamFanart4;
  String? strTeamBanner;
  String? strYoutube;
  String? strLocked;

  TeamId({
    required this.id,
    required this.idTeam,
    required this.idSoccerXml,
    required this.idApIfootball,
    this.intLoved,
    required this.strTeam,
    this.strTeamShort,
    required this.strAlternate,
    required this.intFormedYear,
    required this.strSport,
    required this.strLeague,
    required this.idLeague,
    required this.strLeague2,
    required this.idLeague2,
    required this.strLeague3,
    required this.idLeague3,
    required this.strLeague4,
    this.idLeague4,
    required this.strLeague5,
    this.idLeague5,
    required this.strLeague6,
    this.idLeague6,
    required this.strLeague7,
    this.idLeague7,
    this.strDivision,
    required this.strStadium,
    required this.strKeywords,
    required this.strRss,
    required this.strStadiumThumb,
    required this.strStadiumDescription,
    required this.strStadiumLocation,
    required this.intStadiumCapacity,
    required this.strWebsite,
    required this.strFacebook,
    required this.strTwitter,
    required this.strInstagram,
    required this.strDescriptionEn,
    this.strDescriptionDe,
    this.strDescriptionFr,
    this.strDescriptionCn,
    required this.strDescriptionIt,
    this.strDescriptionJp,
    this.strDescriptionRu,
    this.strDescriptionEs,
    this.strDescriptionPt,
    this.strDescriptionSe,
    this.strDescriptionNl,
    this.strDescriptionHu,
    this.strDescriptionNo,
    this.strDescriptionIl,
    this.strDescriptionPl,
    required this.strKitColour1,
    required this.strKitColour2,
    required this.strKitColour3,
    required this.strGender,
    required this.strCountry,
    required this.strTeamBadge,
    required this.strTeamJersey,
    required this.strTeamLogo,
    required this.strTeamFanart1,
    required this.strTeamFanart2,
    required this.strTeamFanart3,
    required this.strTeamFanart4,
    required this.strTeamBanner,
    required this.strYoutube,
    required this.strLocked,
  });

  factory TeamId.fromJson(Map<String, dynamic> json) => TeamId(
    id: json["id"],
    idTeam: json["idTeam"],
    idSoccerXml: json["idSoccerXML"],
    idApIfootball: json["idAPIfootball"],
    intLoved: json["intLoved"],
    strTeam: json["strTeam"],
    strTeamShort: json["strTeamShort"],
    strAlternate: json["strAlternate"],
    intFormedYear: json["intFormedYear"],
    strSport: json["strSport"],
    strLeague: json["strLeague"],
    idLeague: json["idLeague"],
    strLeague2: json["strLeague2"],
    idLeague2: json["idLeague2"],
    strLeague3: json["strLeague3"],
    idLeague3: json["idLeague3"],
    strLeague4: json["strLeague4"],
    idLeague4: json["idLeague4"],
    strLeague5: json["strLeague5"],
    idLeague5: json["idLeague5"],
    strLeague6: json["strLeague6"],
    idLeague6: json["idLeague6"],
    strLeague7: json["strLeague7"],
    idLeague7: json["idLeague7"],
    strDivision: json["strDivision"],
    strStadium: json["strStadium"],
    strKeywords: json["strKeywords"],
    strRss: json["strRSS"],
    strStadiumThumb: json["strStadiumThumb"],
    strStadiumDescription: json["strStadiumDescription"],
    strStadiumLocation: json["strStadiumLocation"],
    intStadiumCapacity: json["intStadiumCapacity"],
    strWebsite: json["strWebsite"],
    strFacebook: json["strFacebook"],
    strTwitter: json["strTwitter"],
    strInstagram: json["strInstagram"],
    strDescriptionEn: json["strDescriptionEN"],
    strDescriptionDe: json["strDescriptionDE"],
    strDescriptionFr: json["strDescriptionFR"],
    strDescriptionCn: json["strDescriptionCN"],
    strDescriptionIt: json["strDescriptionIT"],
    strDescriptionJp: json["strDescriptionJP"],
    strDescriptionRu: json["strDescriptionRU"],
    strDescriptionEs: json["strDescriptionES"],
    strDescriptionPt: json["strDescriptionPT"],
    strDescriptionSe: json["strDescriptionSE"],
    strDescriptionNl: json["strDescriptionNL"],
    strDescriptionHu: json["strDescriptionHU"],
    strDescriptionNo: json["strDescriptionNO"],
    strDescriptionIl: json["strDescriptionIL"],
    strDescriptionPl: json["strDescriptionPL"],
    strKitColour1: json["strKitColour1"],
    strKitColour2: json["strKitColour2"],
    strKitColour3: json["strKitColour3"],
    strGender: json["strGender"],
    strCountry: json["strCountry"],
    strTeamBadge: json["strTeamBadge"],
    strTeamJersey: json["strTeamJersey"],
    strTeamLogo: json["strTeamLogo"],
    strTeamFanart1: json["strTeamFanart1"],
    strTeamFanart2: json["strTeamFanart2"],
    strTeamFanart3: json["strTeamFanart3"],
    strTeamFanart4: json["strTeamFanart4"],
    strTeamBanner: json["strTeamBanner"],
    strYoutube: json["strYoutube"],
    strLocked: json["strLocked"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "idTeam": idTeam,
    "idSoccerXML": idSoccerXml,
    "idAPIfootball": idApIfootball,
    "intLoved": intLoved,
    "strTeam": strTeam,
    "strTeamShort": strTeamShort,
    "strAlternate": strAlternate,
    "intFormedYear": intFormedYear,
    "strSport": strSport,
    "strLeague": strLeague,
    "idLeague": idLeague,
    "strLeague2": strLeague2,
    "idLeague2": idLeague2,
    "strLeague3": strLeague3,
    "idLeague3": idLeague3,
    "strLeague4": strLeague4,
    "idLeague4": idLeague4,
    "strLeague5": strLeague5,
    "idLeague5": idLeague5,
    "strLeague6": strLeague6,
    "idLeague6": idLeague6,
    "strLeague7": strLeague7,
    "idLeague7": idLeague7,
    "strDivision": strDivision,
    "strStadium": strStadium,
    "strKeywords": strKeywords,
    "strRSS": strRss,
    "strStadiumThumb": strStadiumThumb,
    "strStadiumDescription": strStadiumDescription,
    "strStadiumLocation": strStadiumLocation,
    "intStadiumCapacity": intStadiumCapacity,
    "strWebsite": strWebsite,
    "strFacebook": strFacebook,
    "strTwitter": strTwitter,
    "strInstagram": strInstagram,
    "strDescriptionEN": strDescriptionEn,
    "strDescriptionDE": strDescriptionDe,
    "strDescriptionFR": strDescriptionFr,
    "strDescriptionCN": strDescriptionCn,
    "strDescriptionIT": strDescriptionIt,
    "strDescriptionJP": strDescriptionJp,
    "strDescriptionRU": strDescriptionRu,
    "strDescriptionES": strDescriptionEs,
    "strDescriptionPT": strDescriptionPt,
    "strDescriptionSE": strDescriptionSe,
    "strDescriptionNL": strDescriptionNl,
    "strDescriptionHU": strDescriptionHu,
    "strDescriptionNO": strDescriptionNo,
    "strDescriptionIL": strDescriptionIl,
    "strDescriptionPL": strDescriptionPl,
    "strKitColour1": strKitColour1,
    "strKitColour2": strKitColour2,
    "strKitColour3": strKitColour3,
    "strGender": strGender,
    "strCountry": strCountry,
    "strTeamBadge": strTeamBadge,
    "strTeamJersey": strTeamJersey,
    "strTeamLogo": strTeamLogo,
    "strTeamFanart1": strTeamFanart1,
    "strTeamFanart2": strTeamFanart2,
    "strTeamFanart3": strTeamFanart3,
    "strTeamFanart4": strTeamFanart4,
    "strTeamBanner": strTeamBanner,
    "strYoutube": strYoutube,
    "strLocked": strLocked,
  };
}
