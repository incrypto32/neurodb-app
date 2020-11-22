import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable(nullable: false)
class Patient {
  String id;
  String name;
  String sex;
  String age;
  String room;
  String date;
  String address;
  String phone;
  @JsonKey(nullable: true, defaultValue: "NIL")
  String currentMedication;
  Diagnosis diagnosis;
  PresentHistory presentHistory;
  PersonalHistory personalHistory;
  PastHistory pastHistory;
  Vitals vitals;
  Patient();

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
  Map<String, dynamic> toJson() => _$PatientToJson(this);
}

@JsonSerializable(nullable: false)
class Diagnosis {
  @JsonKey(nullable: true, defaultValue: "")
  String pd1;
  @JsonKey(nullable: true, defaultValue: "")
  String pd2;
  @JsonKey(nullable: true, defaultValue: "")
  String pd3;
  @JsonKey(name: 'final', defaultValue: "", nullable: true)
  String finalDiagnosis;
  String icd;
  Diagnosis();
  factory Diagnosis.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisFromJson(json);
  Map<String, dynamic> toJson() => _$DiagnosisToJson(this);
}

@JsonSerializable(nullable: false)
class History {
  @JsonKey(nullable: true, defaultValue: "")
  String description;
  @JsonKey(nullable: true, defaultValue: "")
  String duration;
  History();
  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
  Map<String, dynamic> toJson() => _$HistoryToJson(this);
}

@JsonSerializable(nullable: false)
class PresentHistory {
  History ph1;
  History ph2;
  History ph3;
  PresentHistory();
  factory PresentHistory.fromJson(Map<String, dynamic> json) =>
      _$PresentHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PresentHistoryToJson(this);
}

@JsonSerializable(nullable: false)
class PastHistory {
  @JsonKey(nullable: true, defaultValue: false)
  bool diabates;
  @JsonKey(nullable: true, defaultValue: false)
  bool hyperTension;
  @JsonKey(nullable: true, defaultValue: false)
  bool cva;

  @JsonKey(nullable: true, defaultValue: "")
  String other;
  PastHistory();
  factory PastHistory.fromJson(Map<String, dynamic> json) =>
      _$PastHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PastHistoryToJson(this);
}

@JsonSerializable(nullable: false)
class PersonalHistory {
  @JsonKey(nullable: true, defaultValue: false)
  bool currentSmoker;
  @JsonKey(nullable: true, defaultValue: false)
  bool exSmoker;
  @JsonKey(nullable: true, defaultValue: false)
  bool alcoholic;
  @JsonKey(nullable: true, defaultValue: "")
  String sleep;
  @JsonKey(nullable: true, defaultValue: "NIL")
  String bowelBladderHistory;
  @JsonKey(nullable: true, defaultValue: "NIL")
  String familyHistory;
  @JsonKey(nullable: true, defaultValue: "NIL")
  String otherRemarks;

  PersonalHistory();

  factory PersonalHistory.fromJson(Map<String, dynamic> json) =>
      _$PersonalHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$PersonalHistoryToJson(this);

  personalHistory() {
    String personalHistory = "";

    String out;

    personalHistory += alcoholic ? "Alcoholic, " : "";
    personalHistory += currentSmoker ? "Current Smoker, " : "";
    personalHistory += exSmoker ? "Ex Smoker " : "";

    out =
        "$personalHistory\nSleep : $sleep\nBowel/Bladder History : $bowelBladderHistory";
    return out;
  }
}

@JsonSerializable(nullable: false)
class Vitals {
  @JsonKey(nullable: true, defaultValue: "Unavailbale")
  String bp;
  @JsonKey(nullable: true, defaultValue: "Unavailbale")
  String pulse;
  @JsonKey(nullable: true, defaultValue: "Unavailbale")
  String respRate;
  @JsonKey(nullable: true, defaultValue: "Unavailbale")
  String sp02;
  @JsonKey(nullable: true, defaultValue: "Unavailbale")
  String grbs;

  Vitals();

  factory Vitals.fromJson(Map<String, dynamic> json) => _$VitalsFromJson(json);
  Map<String, dynamic> toJson() => _$VitalsToJson(this);
}
