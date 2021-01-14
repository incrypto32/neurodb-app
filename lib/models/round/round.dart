import 'package:json_annotation/json_annotation.dart';

part 'round.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class RoundsData {
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String bp;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String temp;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String pulse;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String respRate;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String sp02;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String grbs;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String newComplaints;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String currentStatus;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String investigation;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String medication;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String comment;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  String status;
  @JsonKey(nullable: true, defaultValue: "_", includeIfNull: false)
  dynamic timeStamp;
  @JsonKey(nullable: true)
  Procedures procedures;

  RoundsData() {
    procedures = Procedures();
  }

  factory RoundsData.fromJson(Map<String, dynamic> json) =>
      _$RoundsDataFromJson(json);
  Map<String, dynamic> toJson() => _$RoundsDataToJson(this);

  bool get isEmpty => this.toJson().keys.length == 0;
  DateTime get dateTime => (timeStamp.toDate() as DateTime).toLocal();
}

@JsonSerializable(nullable: true)
class Procedures {
  Procedures({
    this.mechanicalThrombectomy = false,
    this.thrombolysis = false,
    this.conservative = false,
  });

  @JsonKey(nullable: true, defaultValue: false)
  bool mechanicalThrombectomy;
  @JsonKey(nullable: true, defaultValue: false)
  bool thrombolysis;
  @JsonKey(nullable: true, defaultValue: false)
  bool conservative;

  factory Procedures.fromJson(Map<String, dynamic> json) =>
      _$ProceduresFromJson(json);

  Map<String, dynamic> toJson() => _$ProceduresToJson(this);

  String stringRep() {
    String res = "";
    res += mechanicalThrombectomy ? "Mechanical Thrombectomy\n" : "";
    res += thrombolysis ? "Thrombolysis\n" : "";
    res += conservative ? "Conservative\n" : "";
    return res;
  }
}
