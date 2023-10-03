// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

List<TeamModel> teamModelFromJson(String str) => List<TeamModel>.from(json.decode(str).map((x) => TeamModel.fromJson(x)));

String teamModelToJson(List<TeamModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TeamModel {
  int? id;
  String? idTeam;
  String? idSoccerXml;
  String? idApIfootball;
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
  dynamic idLeague6;
  String? strLeague7;
  dynamic idLeague7;
  dynamic strDivision;
  String? strStadium;
  String? strKeywords;
  String? strRss;
  String? strStadiumThumb;
  String? strStadiumDescription;
  String? strStadiumLocation;
  int? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEn;
  String? strDescriptionDe;
  String? strDescriptionFr;
  dynamic strDescriptionCn;
  String? strDescriptionIt;
  String? strDescriptionJp;
  String? strDescriptionRu;
  String? strDescriptionEs;
  String? strDescriptionPt;
  dynamic strDescriptionSe;
  dynamic strDescriptionNl;
  dynamic strDescriptionHu;
  String? strDescriptionNo;
  dynamic strDescriptionIl;
  dynamic strDescriptionPl;
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

  TeamModel({
    this.id,
    this.idTeam,
    this.idSoccerXml,
    this.idApIfootball,
    this.intLoved,
    this.strTeam,
    this.strTeamShort,
    this.strAlternate,
    this.intFormedYear,
    this.strSport,
    this.strLeague,
    this.idLeague,
    this.strLeague2,
    this.idLeague2,
    this.strLeague3,
    this.idLeague3,
    this.strLeague4,
    this.idLeague4,
    this.strLeague5,
    this.idLeague5,
    this.strLeague6,
    this.idLeague6,
    this.strLeague7,
    this.idLeague7,
    this.strDivision,
    this.strStadium,
    this.strKeywords,
    this.strRss,
    this.strStadiumThumb,
    this.strStadiumDescription,
    this.strStadiumLocation,
    this.intStadiumCapacity,
    this.strWebsite,
    this.strFacebook,
    this.strTwitter,
    this.strInstagram,
    this.strDescriptionEn,
    this.strDescriptionDe,
    this.strDescriptionFr,
    this.strDescriptionCn,
    this.strDescriptionIt,
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
    this.strKitColour1,
    this.strKitColour2,
    this.strKitColour3,
    this.strGender,
    this.strCountry,
    this.strTeamBadge,
    this.strTeamJersey,
    this.strTeamLogo,
    this.strTeamFanart1,
    this.strTeamFanart2,
    this.strTeamFanart3,
    this.strTeamFanart4,
    this.strTeamBanner,
    this.strYoutube,
    this.strLocked,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
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
