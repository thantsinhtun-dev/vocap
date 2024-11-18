
import '../../../../domain/entities/general/general_entity.dart';

class GeneralResponse {
  String? status;
  String? message;

  GeneralResponse({
    this.status,
    this.message,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };

  GeneralEntity toEntity() {
    return GeneralEntity(
      status: status ?? "",
      message: message ?? "",
    );
  }
}
