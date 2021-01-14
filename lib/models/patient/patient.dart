import 'package:json_annotation/json_annotation.dart';

part 'patient.g.dart';

@JsonSerializable(nullable: false)
class Patient {
  String id;
  String docId;
  String name;
  String sex;
  String age;
  String room;
  dynamic date;
  String address;
  String phone;
  String alternatePhone;
  bool inPatient;
  @JsonKey(nullable: true, defaultValue: "NIL")
  String currentMedication;
  Diagnosis diagnosis;
  PresentHistory presentHistory;
  PersonalHistory personalHistory;
  CranialNerve cranialNerve;
  HigherMentalFunction higherMentalFunction;
  PastHistory pastHistory;
  Vitals vitals;
  Patient();

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
  Map<String, dynamic> toJson() => _$PatientToJson(this);

  Patient setId(String id) {
    this.docId = id;
    return this;
  }
}

@JsonSerializable(nullable: false)
class Diagnosis {
  @JsonKey(nullable: true, defaultValue: "_")
  String pd1;
  @JsonKey(nullable: true, defaultValue: "_")
  String pd2;
  @JsonKey(nullable: true, defaultValue: "_")
  String pd3;
  @JsonKey(name: 'final', defaultValue: "_", nullable: true)
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
  History ph4;
  History ph5;
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
  @JsonKey(nullable: true, defaultValue: false)
  bool tobaccoChewing;
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
    personalHistory += tobaccoChewing ? "Tobacco Chewer" : "";

    out =
        "$personalHistory\nSleep : $sleep\nBowel/Bladder History : $bowelBladderHistory";
    return out;
  }
}

@JsonSerializable(nullable: false)
class Vitals {
  @JsonKey(nullable: true, defaultValue: "_")
  String bp;
  @JsonKey(nullable: true, defaultValue: "_")
  String pulse;
  @JsonKey(nullable: true, defaultValue: "_")
  String respRate;
  @JsonKey(nullable: true, defaultValue: "_")
  String sp02;
  @JsonKey(nullable: true, defaultValue: "_")
  String grbs;

  Vitals();

  factory Vitals.fromJson(Map<String, dynamic> json) => _$VitalsFromJson(json);
  Map<String, dynamic> toJson() => _$VitalsToJson(this);
}

@JsonSerializable(nullable: false)
class HigherMentalFunction {
  @JsonKey(nullable: true, defaultValue: "_")
  String attention;
  @JsonKey(nullable: true, defaultValue: "_")
  String levelOfConsiousness;
  @JsonKey(nullable: true, defaultValue: "_")
  String memory;
  @JsonKey(nullable: true, defaultValue: "_")
  String speech;
  @JsonKey(nullable: true, defaultValue: "_")
  String mmse;

  HigherMentalFunction();

  factory HigherMentalFunction.fromJson(Map<String, dynamic> json) =>
      _$HigherMentalFunctionFromJson(json);
  Map<String, dynamic> toJson() => _$HigherMentalFunctionToJson(this);
}

@JsonSerializable(nullable: false)
class CranialNerve {
  @JsonKey(nullable: true, defaultValue: "_")
  String cerebralSign;
  @JsonKey(nullable: true, defaultValue: "_")
  String motorSystem;
  @JsonKey(nullable: true, defaultValue: "_")
  String meningialSign;
  @JsonKey(nullable: true, defaultValue: "_")
  String periferalNerves;
  @JsonKey(nullable: true, defaultValue: "_")
  String sensorySystem;

  CranialNerve();

  factory CranialNerve.fromJson(Map<String, dynamic> json) =>
      _$CranialNerveFromJson(json);
  Map<String, dynamic> toJson() => _$CranialNerveToJson(this);
}

@JsonSerializable(nullable: false)
class PatientFile {
  @JsonKey(nullable: true, defaultValue: "_")
  String name;
  @JsonKey(nullable: true, defaultValue: "_")
  String title;
  @JsonKey(nullable: true, defaultValue: "_")
  String url;

  PatientFile();

  factory PatientFile.fromJson(Map<String, dynamic> json) =>
      _$PatientFileFromJson(json);
  Map<String, dynamic> toJson() => _$PatientFileToJson(this);
}
