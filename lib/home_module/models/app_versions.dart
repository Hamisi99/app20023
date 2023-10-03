// To parse this JSON data, do
//
//     final appVersion = appVersionFromJson(jsonString);

import 'dart:convert';

List<AppVersion> appVersionFromJson(String str) => List<AppVersion>.from(json.decode(str).map((x) => AppVersion.fromJson(x)));

String appVersionToJson(List<AppVersion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppVersion {
  int id;
  String version;
  DateTime versionDate;
  String versionReleaseNote;

  AppVersion({
    required this.id,
    required this.version,
    required this.versionDate,
    required this.versionReleaseNote,
  });

  factory AppVersion.fromJson(Map<String, dynamic> json) => AppVersion(
    id: json["id"],
    version: json["version"],
    versionDate: DateTime.parse(json["version_date"]),
    versionReleaseNote: json["version_release_note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "version": version,
    "version_date": "${versionDate.year.toString().padLeft(4, '0')}-${versionDate.month.toString().padLeft(2, '0')}-${versionDate.day.toString().padLeft(2, '0')}",
    "version_release_note": versionReleaseNote,
  };
}
