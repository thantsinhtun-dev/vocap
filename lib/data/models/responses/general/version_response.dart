import '../../../../domain/entities/general/version_entity.dart';

class VersionResponse {
  String? status;
  String? androidVersion;
  String? iosVersion;
  String? message;

  VersionResponse({
    this.status,
    this.androidVersion,
    this.iosVersion,
    this.message,
  });

  factory VersionResponse.fromJson(Map<String, dynamic> json) => VersionResponse(
    status: json["status"],
    androidVersion: json["android_version"],
    iosVersion: json["ios_version"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "android_version": androidVersion,
    "ios_version": iosVersion,
    "message": message,
  };

  VersionEntity toEntity() {
    return VersionEntity(
      iosVersion: iosVersion ?? "",
      androidVersion: androidVersion ?? "",
      message: message ?? "",
    );
  }
}